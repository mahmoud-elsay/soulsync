import 'package:flutter/material.dart';
import 'package:soulsync/soul_sync.dart';
import 'package:soulsync/core/di/di.dart';
import 'package:soulsync/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soulsync/core/supabase/supabase_helper.dart';
import 'package:soulsync/core/helpers/shared_pref_helper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await SupabaseHelper.init();

  // Setup dependency injection
  setupDi();

  // Check authentication state
  String initialRoute = await _determineInitialRoute();

  runApp(SoulSync(initialRoute: initialRoute, navigatorKey: navigatorKey));
}

Future<String> _determineInitialRoute() async {
  try {
    // Check if it's first time opening the app
    bool isFirstTime =
        await SharedPrefHelper.getBool(SharedPrefKeys.isFirstTime) ?? true;

    debugPrint('=== Route Determination Debug ===');
    debugPrint('isFirstTime: $isFirstTime');

    if (isFirstTime) {
      return Routes.splashScreen;
    }

    // Check if user has seen onboarding
    bool hasSeenOnboarding =
        await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding) ??
        false;

    debugPrint('hasSeenOnboarding: $hasSeenOnboarding');

    if (!hasSeenOnboarding) {
      debugPrint('User has not seen onboarding - going to onboarding');
      return Routes.onboardingScreen;
    }

    // Check stored login state first (this is the key change)
    bool isLoggedIn =
        await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn) ?? false;

    debugPrint('isLoggedIn: $isLoggedIn');

    if (isLoggedIn) {
      // Check if we have stored user data
      String token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      String userId = await SharedPrefHelper.getString(SharedPrefKeys.userId);

      debugPrint('token.isNotEmpty: ${token.isNotEmpty}');
      debugPrint('userId.isNotEmpty: ${userId.isNotEmpty}');

      if (token.isNotEmpty && userId.isNotEmpty) {
        // We have valid stored credentials, try to validate with Supabase
        final supabase = Supabase.instance.client;
        final session = supabase.auth.currentSession;

        if (session != null) {
          // We have both stored data and active session - user is logged in
          try {
            // Optional: verify session is still valid (but don't fail if network is down)
            await supabase.auth.getUser();
            debugPrint('Session validated successfully');
          } catch (e) {
            // Network might be down, but we have valid stored credentials
            debugPrint(
              'Session validation failed (possibly network issue): $e',
            );
            // Don't clear data here - trust the stored login state
          }
          return Routes.appLayout;
        } else {
          // No active session but we have stored login data
          // This can happen after app restart - trust the stored data
          debugPrint(
            'No active session but user has stored login data - keeping logged in',
          );
          return Routes.appLayout;
        }
      } else {
        // Stored login state is true but missing essential data - clear and redirect to login
        await _clearAuthData();
        return Routes.loginScreen;
      }
    }

    // Check Supabase session as fallback (in case user data wasn't properly stored)
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;

    if (session != null) {
      try {
        // Validate and restore session data
        final user = await supabase.auth.getUser();
        if (user.user != null) {
          // Restore login state
          await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            session.accessToken,
          );
          await SharedPrefHelper.setData(
            SharedPrefKeys.userEmail,
            session.user.email ?? '',
          );
          await SharedPrefHelper.setData(
            SharedPrefKeys.userId,
            session.user.id,
          );

          debugPrint('Restored session data from active Supabase session');
          return Routes.homeScreen;
        }
      } catch (e) {
        // Session is invalid
        debugPrint('Invalid Supabase session: $e');
        await _clearAuthData();
      }
    }

    return Routes.loginScreen;
  } catch (e) {
    debugPrint('Error determining initial route: $e');
    return Routes.loginScreen;
  }
}

Future<void> _clearAuthData() async {
  await SharedPrefHelper.removeData(SharedPrefKeys.isLoggedIn);
  await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
  await SharedPrefHelper.removeData(SharedPrefKeys.userEmail);
  await SharedPrefHelper.removeData(SharedPrefKeys.userId);
  await SharedPrefHelper.removeData(SharedPrefKeys.userName);

  // Also sign out from Supabase
  try {
    await Supabase.instance.client.auth.signOut();
  } catch (e) {
    debugPrint('Error signing out from Supabase: $e');
  }
}

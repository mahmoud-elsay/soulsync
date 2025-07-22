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

    if (isFirstTime) {
      return Routes.splashScreen;
    }

    // Check if user has seen onboarding
    bool hasSeenOnboarding =
        await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding) ??
        false;

    if (!hasSeenOnboarding) {
      return Routes.onboardingScreen;
    }

    // Check Supabase session
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;

    if (session != null) {
      // Verify if the session is still valid
      try {
        await supabase.auth.getUser();
        // Session is valid, mark as logged in
        await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userToken,
          session.accessToken,
        );
        await SharedPrefHelper.setData(
          SharedPrefKeys.userEmail,
          session.user.email ?? '',
        );
        await SharedPrefHelper.setData(SharedPrefKeys.userId, session.user.id);

        return Routes.homeScreen;
      } catch (e) {
        // Session is invalid, clear stored data
        await _clearAuthData();
        return Routes.loginScreen;
      }
    }

    // Check stored login state
    bool isLoggedIn =
        await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn) ?? false;

    if (isLoggedIn) {
      // Check if we have a valid token
      String token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      if (token.isNotEmpty) {
        return Routes.homeScreen;
      } else {
        // No valid token, clear login state
        await _clearAuthData();
        return Routes.loginScreen;
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
}

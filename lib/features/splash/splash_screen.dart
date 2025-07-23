import 'package:flutter/material.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:soulsync/core/helpers/extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/core/helpers/shared_pref_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _controller.forward();
    _navigateAfterDelay();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeIn),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  void _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 4), () async {
      if (!mounted) return;

      // Mark that user has seen the splash (first time is false now)
      await SharedPrefHelper.setData(SharedPrefKeys.isFirstTime, false);

      String nextRoute = await _determineNextRoute();

      context.pushReplacementNamed(nextRoute);
    });
  }

  Future<String> _determineNextRoute() async {
    try {
      // Check if user has seen onboarding
      bool hasSeenOnboarding =
          await SharedPrefHelper.getBool(SharedPrefKeys.hasSeenOnboarding) ??
          false;

      if (!hasSeenOnboarding) {
        return Routes.onboardingScreen;
      }

      // Check if user is logged in
      bool isLoggedIn =
          await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn) ?? false;

      if (isLoggedIn) {
        // Verify we have essential login data
        String token = await SharedPrefHelper.getSecuredString(
          SharedPrefKeys.userToken,
        );
        String userId = await SharedPrefHelper.getString(SharedPrefKeys.userId);

        if (token.isNotEmpty && userId.isNotEmpty) {
          debugPrint('User is logged in - navigating to home');
          return Routes.homeScreen;
        } else {
          // Clear invalid login state
          await _clearAuthData();
        }
      }

      // Check Supabase session as fallback
      final supabase = Supabase.instance.client;
      final session = supabase.auth.currentSession;

      if (session != null && session.user != null) {
        // Restore login state from active session
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

        debugPrint('Restored session - navigating to home');
        return Routes.homeScreen;
      }

      return Routes.loginScreen;
    } catch (e) {
      debugPrint('Error determining next route: $e');
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value * _pulseAnimation.value,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200.w,
                  height: 200.h,
                ),
              ),
              if (_controller.value > 0.8)
                const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

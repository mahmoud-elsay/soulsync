import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:soulsync/features/splash/splash_screen.dart';
import 'package:soulsync/features/auth/login/ui/login_screen.dart';
import 'package:soulsync/features/onboarding/onboarding_screen.dart';
import 'package:soulsync/features/auth/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}

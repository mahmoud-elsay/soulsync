import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:soulsync/features/splash/splash_screen.dart';
import 'package:soulsync/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

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

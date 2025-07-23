import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:soulsync/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/features/home/ui/home_screen.dart';
import 'package:soulsync/features/splash/splash_screen.dart';
import 'package:soulsync/features/library/ui/library_screen.dart';
import 'package:soulsync/features/profile/ui/profile_screen.dart';
import 'package:soulsync/features/auth/login/ui/login_screen.dart';
import 'package:soulsync/features/onboarding/onboarding_screen.dart';
import 'package:soulsync/features/auth/login/logic/login_cubit.dart';
import 'package:soulsync/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:soulsync/features/meditation_player/ui/meditation_player_screen.dart';


class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen(),
              ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.meditationPlayer:
        return MaterialPageRoute(
          builder: (_) => const MeditationPlayerScreen(),
        );
      case Routes.libraryScreen:
        return MaterialPageRoute(
          builder: (_) => const LibraryScreen(),
        );
        case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

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

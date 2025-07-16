import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
                verticalSpace(40),
                Text(
                  'WELCOME',
                  style: TextStyles.whiteAlegreya40Bold,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(16),
                Text(
                  'Do meditation. Stay focused. Live a healthy life.',
                  style: TextStyles.whiteAlegreyaSans20Medium,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: 'Login with Email',
                  textStyle: TextStyles.whiteAlegreyaSans25Medium,
                  onPressed: () {},
                ),
                verticalSpace(16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyles.whiteAlegreyaSans20Medium,
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyles.whiteAlegreyaSans20Bold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
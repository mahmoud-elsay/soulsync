import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:soulsync/features/auth/sign_up/ui/widgets/sign_up_fotter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(40),
                            Image.asset(
                              'assets/images/logo_icon.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                            verticalSpace(40),
                            Text(
                              'Sign Up',
                              style: TextStyles.whiteAlegreya30Medium,
                            ),
                            verticalSpace(16),
                            Text(
                              'Sign up now for free and start meditating, and explore Medic.',
                              style: TextStyles.lightGreyAlegreyaSans22Regular,
                            ),
                            verticalSpace(40),
                            const SignUpForm(),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const SignUpFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/features/auth/login/ui/widgets/login_form.dart';
import 'package:soulsync/features/auth/login/ui/widgets/login_fotter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                              'Sign In',
                              style: TextStyles.whiteAlegreya30Medium,
                            ),
                            verticalSpace(16),
                            Text(
                              'Sign in now to access your exercises and saved music.',
                              style: TextStyles.lightGreyAlegreyaSans22Regular,
                            ),
                            verticalSpace(40),
                            const LoginForm(),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const LoginFooter(),
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

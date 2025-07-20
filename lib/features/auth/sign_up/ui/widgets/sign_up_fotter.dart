import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:soulsync/core/helpers/extension.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/leaves_group.png',
          width: double.infinity,
          height: 300.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyles.whiteAlegreyaSans20Medium,
                ),
                TextSpan(
                  text: 'Sign In',
                  style: TextStyles.whiteAlegreyaSans20Bold,
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(Routes.loginScreen);
                        },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

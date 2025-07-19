import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/helpers/extension.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';
import 'package:soulsync/core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscureText = true;

  void _toggleObscureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

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
                            AppTextFormField(hintText: 'Email Address'),
                            verticalSpace(20),
                            AppTextFormField(
                              hintText: 'Password',
                              isObscureText: _isObscureText,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                color: Colors.grey,
                                onPressed: _toggleObscureText,
                              ),
                            ),
                            verticalSpace(10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style:
                                    TextStyles.lightGreyAlegreyaSans18Regular,
                              ),
                            ),
                            verticalSpace(40),
                            AppTextButton(
                              buttonText: 'Login',
                              textStyle: TextStyles.whiteAlegreyaSans25Medium,
                              onPressed: () {},
                            ),
                            verticalSpace(16),
                          ],
                        ),
                      ),
                      // Remove Expanded and use flexible space instead
                      const Spacer(),
                      Stack(
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
                                    text: "Don't have an account? ",
                                    style: TextStyles.whiteAlegreyaSans20Medium,
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyles.whiteAlegreyaSans20Bold,
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            context.pushNamed(
                                              Routes.signUpScreen,
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

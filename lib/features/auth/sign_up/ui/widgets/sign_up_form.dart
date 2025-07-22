import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';
import 'package:soulsync/core/widgets/app_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscureText = true;

  void _toggleObscureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(hintText: 'Name'),
        verticalSpace(20),
        AppTextFormField(hintText: 'Email Address'),
        verticalSpace(20),
        AppTextFormField(
          hintText: 'Password',
          isObscureText: _isObscureText,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
            color: Colors.grey,
            onPressed: _toggleObscureText,
          ),
        ),
        verticalSpace(40),
        AppTextButton(
          buttonText: 'Sign Up',
          textStyle: TextStyles.whiteAlegreyaSans25Medium,
          onPressed: () {},
        ),
        verticalSpace(16),
      ],
    );
  }
}

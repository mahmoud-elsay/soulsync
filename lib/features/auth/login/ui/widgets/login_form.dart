import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';
import 'package:soulsync/core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
        verticalSpace(10),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: TextStyles.lightGreyAlegreyaSans18Regular,
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
    );
  }
}

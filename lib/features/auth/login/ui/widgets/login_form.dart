import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/helpers/extension.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/helpers/app_validation.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';
import 'package:soulsync/core/widgets/app_text_form_field.dart';
import 'package:soulsync/features/auth/login/logic/login_cubit.dart';
import 'package:soulsync/features/auth/login/logic/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleObscureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful!'),
                backgroundColor: Colors.green,
              ),
            );
            
            context.pushReplacementNamed(Routes.homeScreen);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              controller: _emailController,
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
            verticalSpace(20),
            AppTextFormField(
              controller: _passwordController,
              hintText: 'Password',
              isObscureText: _isObscureText,
              validator: validatePassword,
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
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AppTextButton(
                  buttonText: state.maybeWhen(
                    loading: () => 'Logging In...',
                    orElse: () => 'Login',
                  ),
                  textStyle: TextStyles.whiteAlegreyaSans25Medium,
                  onPressed: state.maybeWhen(
                    loading: () => () {},
                    orElse: () => _login,
                  ),
                );
              },
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
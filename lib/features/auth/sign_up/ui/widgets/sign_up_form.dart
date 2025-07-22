import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/helpers/app_validation.dart';
import 'package:soulsync/core/widgets/app_text_button.dart';
import 'package:soulsync/core/widgets/app_text_form_field.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_state.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleObscureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Sign up successful! Please check your email for verification.',
                ),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to login or home screen
            Navigator.of(context).pushReplacementNamed('/loginScreen');
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
              controller: _nameController,
              hintText: 'Name',
              validator: validateName,
            ),
            verticalSpace(20),
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
            verticalSpace(40),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return AppTextButton(
                  buttonText: state.maybeWhen(
                    loading: () => 'Signing Up...',
                    orElse: () => 'Sign Up',
                  ),
                  textStyle: TextStyles.whiteAlegreyaSans25Medium,
                  onPressed: state.maybeWhen(
                    loading: () => () {},
                    orElse: () => _signUp,
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

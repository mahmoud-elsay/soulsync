import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/supabase/supabase_error_model.dart';
import 'package:soulsync/core/supabase/supabase_error_handler.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:soulsync/features/auth/sign_up/data/supabase_services/sign_up_service.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpSupabaseService _signUpService;

  SignUpCubit(this._signUpService) : super(const SignUpState.initial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());

    try {
      print('Starting signup process...');

      final response = await _signUpService.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      print('Signup response received: ${response.user?.id}');
      print('User email confirmed: ${response.user?.emailConfirmedAt}');

      if (response.user != null) {
        print('Emitting success state');
        emit(const SignUpState.success());
      } else {
        print('No user in response');
        emit(
          SignUpState.error(
            SupabaseErrorModel(message: 'Sign up failed. No user created.'),
          ),
        );
      }
    } catch (e) {
      print('Signup error caught: $e');

      emit(SignUpState.error(SupabaseErrorHandler.handle(e)));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/supabase/supabase_result.dart';
import 'package:soulsync/core/supabase/supabase_error_model.dart';
import 'package:soulsync/features/auth/login/logic/login_state.dart';
import 'package:soulsync/features/auth/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _repo;

  LoginCubit(this._repo) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());

    try {
      final result = await _repo.login(email: email, password: password);

      if (result is Success) {
        emit(LoginState.success(result.data));
      } else if (result is Failure) {
        emit(LoginState.error(result.error));
      }
    } catch (e) {
      emit(
        LoginState.error(
          SupabaseErrorModel(
            message: 'An unexpected error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }
}

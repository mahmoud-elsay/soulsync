import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/core/supabase/supabase_error_model.dart';
import 'package:soulsync/features/auth/login/logic/login_state.dart';
import 'package:soulsync/features/auth/login/data/repo/login_repo.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _repo;

  LoginCubit(this._repo) : super(const LoginState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());

    final result = await _repo.login(
      email: email,
      password: password,
    );

    result.when(
      success: (_) => emit(const LoginState.success()),
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}

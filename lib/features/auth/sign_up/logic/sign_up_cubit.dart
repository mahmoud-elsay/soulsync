import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:soulsync/features/auth/sign_up/data/repos/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());
    final result = await _signUpRepo.signUp(email: email, password: password);
    result.when(
      success: (_) => emit(const SignUpState.success()),
      failure: (error) => emit(SignUpState.error(error)),
    );
  }
}

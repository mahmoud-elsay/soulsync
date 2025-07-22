import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:soulsync/features/auth/sign_up/data/repos/sign_up_repo.dart';

final getIt = GetIt.instance;

void setupDi() {
  // Supabase
  final supabaseClient = Supabase.instance.client;

  //sign up dependencies
  getIt.registerLazySingleton(() => SignUpRepo(supabaseClient));
  getIt.registerFactory(() => SignUpCubit(getIt()));
}

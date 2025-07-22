import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soulsync/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:soulsync/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:soulsync/features/auth/sign_up/data/supabase_services/sign_up_service.dart';

final getIt = GetIt.instance;

void setupDi() {
  // Supabase
  final supabaseClient = Supabase.instance.client;

  // Sign up dependencies
  getIt.registerLazySingleton(() => SignUpRepo(supabaseClient));
  getIt.registerLazySingleton(() => SignUpSupabaseService());
  getIt.registerFactory(() => SignUpCubit(getIt<SignUpSupabaseService>()));
}

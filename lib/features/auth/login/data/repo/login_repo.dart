import 'package:soulsync/core/supabase/supabase_result.dart';
import 'package:soulsync/core/supabase/supabase_error_handler.dart';
import 'package:soulsync/features/auth/login/data/supabase_services/login_service.dart';

class LoginRepo {
  final LoginSupabaseService _service;

  LoginRepo(this._service);

  Future<SupabaseResult<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _service.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return const SupabaseResult.success(null);
      } else {
        return SupabaseResult.failure(
          SupabaseErrorHandler.handle(
            Exception('Login failed: No user returned'),
          ),
        );
      }
    } catch (e) {
      return SupabaseResult.failure(SupabaseErrorHandler.handle(e));
    }
  }
}

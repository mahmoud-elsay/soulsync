import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soulsync/core/supabase/supabase_result.dart';
import 'package:soulsync/core/supabase/supabase_error_handler.dart';

class SignUpRepo {
  final SupabaseClient _supabase;

  SignUpRepo(this._supabase);

  Future<SupabaseResult<void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      return const SupabaseResult.success(null);
    } catch (e) {
      return SupabaseResult.failure(SupabaseErrorHandler.handle(e));
    }
  }
}

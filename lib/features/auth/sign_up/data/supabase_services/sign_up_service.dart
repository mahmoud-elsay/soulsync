import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpSupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );

    if (response.user != null) {
      await _supabase.from('profiles').insert({
        'id': response.user!.id,
        'email': email,
        'name': name,
        'created_at': DateTime.now().toIso8601String(),
      });
    }

    return response;
  }
}

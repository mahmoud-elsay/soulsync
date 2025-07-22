import 'package:supabase_flutter/supabase_flutter.dart';

class LoginSupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
}

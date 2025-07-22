import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpSupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Step 1: Sign up the user
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      print('Auth response: ${response.user?.id}');
      print('Auth response session: ${response.session}');

      // Step 2: If user was created successfully, create profile
      if (response.user != null) {
        try {
          await _supabase.from('profiles').insert({
            'id': response.user!.id,
            'email': email,
            'name': name,
            'created_at': DateTime.now().toIso8601String(),
          });
          print('Profile created successfully');
        } catch (profileError) {
          print('Profile creation error: $profileError');
          // Don't throw here - user is already created
          // We can handle profile creation later or in a background task
        }
      }

      return response;
    } catch (e) {
      print('SignUp error: $e');
      rethrow;
    }
  }
}

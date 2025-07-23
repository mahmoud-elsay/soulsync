import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soulsync/core/supabase/supabase_result.dart';
import 'package:soulsync/core/helpers/shared_pref_helper.dart';
import 'package:soulsync/core/supabase/supabase_error_handler.dart';
import 'package:soulsync/features/auth/login/data/supabase_services/login_service.dart';

class LoginRepo {
  final LoginSupabaseService _service;

  LoginRepo(this._service);

  Future<SupabaseResult<Session>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _service.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.session != null && response.user != null) {
        // Save user data to SharedPreferences here
        await _saveUserData(response.session!);

        return SupabaseResult.success(response.session!);
      } else {
        return SupabaseResult.failure(
          SupabaseErrorHandler.handle(
            Exception('Login failed: No session or user returned'),
          ),
        );
      }
    } catch (e) {
      return SupabaseResult.failure(SupabaseErrorHandler.handle(e));
    }
  }

  Future<void> _saveUserData(Session session) async {
    try {
      await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        session.accessToken,
      );
      await SharedPrefHelper.setData(
        SharedPrefKeys.userEmail,
        session.user.email ?? '',
      );
      await SharedPrefHelper.setData(SharedPrefKeys.userId, session.user.id);

      // If user has display name or metadata, save it
      final userMetadata = session.user.userMetadata;
      if (userMetadata != null && userMetadata['name'] != null) {
        await SharedPrefHelper.setData(
          SharedPrefKeys.userName,
          userMetadata['name'],
        );
      }
    } catch (e) {
      throw Exception('Error saving user data: $e');
    }
  }
}

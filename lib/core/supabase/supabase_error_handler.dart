import 'supabase_error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseErrorHandler {
  static SupabaseErrorModel handle(dynamic error) {
    if (error is AuthException) {
      return SupabaseErrorModel(
        message: error.message,
        statusCode: null,
      );
    } else {
      return SupabaseErrorModel(
        message: 'Unexpected error occurred',
        statusCode: null,
      );
    }
  }
}

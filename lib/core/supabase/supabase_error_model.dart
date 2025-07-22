import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_error_model.freezed.dart';

@freezed
class SupabaseErrorModel with _$SupabaseErrorModel {
  const factory SupabaseErrorModel({required String message, int? statusCode}) =
      _SupabaseErrorModel;

  // Convenience getters
  const SupabaseErrorModel._();

  bool get isAuthError => statusCode == 401;
  bool get isForbiddenError => statusCode == 403;
  bool get isNotFoundError => statusCode == 404;
  bool get isValidationError => statusCode == 422;
  bool get isServerError => statusCode != null && statusCode! >= 500;
  bool get isNetworkError => statusCode != null && statusCode! < 0;
}

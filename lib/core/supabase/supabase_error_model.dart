import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_error_model.freezed.dart';

@freezed
class SupabaseErrorModel with _$SupabaseErrorModel {
  const factory SupabaseErrorModel({required String message, int? statusCode}) =
      _SupabaseErrorModel;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soulsync/core/supabase/supabase_error_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success() = _Success;
  const factory SignUpState.error(SupabaseErrorModel error) = _Error;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SupabaseErrorModel {
  String get message => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Create a copy of SupabaseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupabaseErrorModelCopyWith<SupabaseErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupabaseErrorModelCopyWith<$Res> {
  factory $SupabaseErrorModelCopyWith(
    SupabaseErrorModel value,
    $Res Function(SupabaseErrorModel) then,
  ) = _$SupabaseErrorModelCopyWithImpl<$Res, SupabaseErrorModel>;
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class _$SupabaseErrorModelCopyWithImpl<$Res, $Val extends SupabaseErrorModel>
    implements $SupabaseErrorModelCopyWith<$Res> {
  _$SupabaseErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupabaseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? statusCode = freezed}) {
    return _then(
      _value.copyWith(
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            statusCode:
                freezed == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupabaseErrorModelImplCopyWith<$Res>
    implements $SupabaseErrorModelCopyWith<$Res> {
  factory _$$SupabaseErrorModelImplCopyWith(
    _$SupabaseErrorModelImpl value,
    $Res Function(_$SupabaseErrorModelImpl) then,
  ) = __$$SupabaseErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$SupabaseErrorModelImplCopyWithImpl<$Res>
    extends _$SupabaseErrorModelCopyWithImpl<$Res, _$SupabaseErrorModelImpl>
    implements _$$SupabaseErrorModelImplCopyWith<$Res> {
  __$$SupabaseErrorModelImplCopyWithImpl(
    _$SupabaseErrorModelImpl _value,
    $Res Function(_$SupabaseErrorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupabaseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? statusCode = freezed}) {
    return _then(
      _$SupabaseErrorModelImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        statusCode:
            freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

class _$SupabaseErrorModelImpl implements _SupabaseErrorModel {
  const _$SupabaseErrorModelImpl({required this.message, this.statusCode});

  @override
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'SupabaseErrorModel(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupabaseErrorModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of SupabaseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupabaseErrorModelImplCopyWith<_$SupabaseErrorModelImpl> get copyWith =>
      __$$SupabaseErrorModelImplCopyWithImpl<_$SupabaseErrorModelImpl>(
        this,
        _$identity,
      );
}

abstract class _SupabaseErrorModel implements SupabaseErrorModel {
  const factory _SupabaseErrorModel({
    required final String message,
    final int? statusCode,
  }) = _$SupabaseErrorModelImpl;

  @override
  String get message;
  @override
  int? get statusCode;

  /// Create a copy of SupabaseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupabaseErrorModelImplCopyWith<_$SupabaseErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

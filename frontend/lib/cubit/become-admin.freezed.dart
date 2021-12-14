// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'become-admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BecomeAdminStateTearOff {
  const _$BecomeAdminStateTearOff();

  _BecomeAdminState call(
      {String code = '',
      bool loadingBecomeAdmin = false,
      String errBecomingAdmin = '',
      bool becameAdmin = false}) {
    return _BecomeAdminState(
      code: code,
      loadingBecomeAdmin: loadingBecomeAdmin,
      errBecomingAdmin: errBecomingAdmin,
      becameAdmin: becameAdmin,
    );
  }
}

/// @nodoc
const $BecomeAdminState = _$BecomeAdminStateTearOff();

/// @nodoc
mixin _$BecomeAdminState {
  String get code => throw _privateConstructorUsedError;
  bool get loadingBecomeAdmin => throw _privateConstructorUsedError;
  String get errBecomingAdmin => throw _privateConstructorUsedError;
  bool get becameAdmin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BecomeAdminStateCopyWith<BecomeAdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BecomeAdminStateCopyWith<$Res> {
  factory $BecomeAdminStateCopyWith(
          BecomeAdminState value, $Res Function(BecomeAdminState) then) =
      _$BecomeAdminStateCopyWithImpl<$Res>;
  $Res call(
      {String code,
      bool loadingBecomeAdmin,
      String errBecomingAdmin,
      bool becameAdmin});
}

/// @nodoc
class _$BecomeAdminStateCopyWithImpl<$Res>
    implements $BecomeAdminStateCopyWith<$Res> {
  _$BecomeAdminStateCopyWithImpl(this._value, this._then);

  final BecomeAdminState _value;
  // ignore: unused_field
  final $Res Function(BecomeAdminState) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? loadingBecomeAdmin = freezed,
    Object? errBecomingAdmin = freezed,
    Object? becameAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      loadingBecomeAdmin: loadingBecomeAdmin == freezed
          ? _value.loadingBecomeAdmin
          : loadingBecomeAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      errBecomingAdmin: errBecomingAdmin == freezed
          ? _value.errBecomingAdmin
          : errBecomingAdmin // ignore: cast_nullable_to_non_nullable
              as String,
      becameAdmin: becameAdmin == freezed
          ? _value.becameAdmin
          : becameAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BecomeAdminStateCopyWith<$Res>
    implements $BecomeAdminStateCopyWith<$Res> {
  factory _$BecomeAdminStateCopyWith(
          _BecomeAdminState value, $Res Function(_BecomeAdminState) then) =
      __$BecomeAdminStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      bool loadingBecomeAdmin,
      String errBecomingAdmin,
      bool becameAdmin});
}

/// @nodoc
class __$BecomeAdminStateCopyWithImpl<$Res>
    extends _$BecomeAdminStateCopyWithImpl<$Res>
    implements _$BecomeAdminStateCopyWith<$Res> {
  __$BecomeAdminStateCopyWithImpl(
      _BecomeAdminState _value, $Res Function(_BecomeAdminState) _then)
      : super(_value, (v) => _then(v as _BecomeAdminState));

  @override
  _BecomeAdminState get _value => super._value as _BecomeAdminState;

  @override
  $Res call({
    Object? code = freezed,
    Object? loadingBecomeAdmin = freezed,
    Object? errBecomingAdmin = freezed,
    Object? becameAdmin = freezed,
  }) {
    return _then(_BecomeAdminState(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      loadingBecomeAdmin: loadingBecomeAdmin == freezed
          ? _value.loadingBecomeAdmin
          : loadingBecomeAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      errBecomingAdmin: errBecomingAdmin == freezed
          ? _value.errBecomingAdmin
          : errBecomingAdmin // ignore: cast_nullable_to_non_nullable
              as String,
      becameAdmin: becameAdmin == freezed
          ? _value.becameAdmin
          : becameAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BecomeAdminState implements _BecomeAdminState {
  const _$_BecomeAdminState(
      {this.code = '',
      this.loadingBecomeAdmin = false,
      this.errBecomingAdmin = '',
      this.becameAdmin = false});

  @JsonKey(defaultValue: '')
  @override
  final String code;
  @JsonKey(defaultValue: false)
  @override
  final bool loadingBecomeAdmin;
  @JsonKey(defaultValue: '')
  @override
  final String errBecomingAdmin;
  @JsonKey(defaultValue: false)
  @override
  final bool becameAdmin;

  @override
  String toString() {
    return 'BecomeAdminState(code: $code, loadingBecomeAdmin: $loadingBecomeAdmin, errBecomingAdmin: $errBecomingAdmin, becameAdmin: $becameAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BecomeAdminState &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.loadingBecomeAdmin, loadingBecomeAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.loadingBecomeAdmin, loadingBecomeAdmin)) &&
            (identical(other.errBecomingAdmin, errBecomingAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.errBecomingAdmin, errBecomingAdmin)) &&
            (identical(other.becameAdmin, becameAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.becameAdmin, becameAdmin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(loadingBecomeAdmin) ^
      const DeepCollectionEquality().hash(errBecomingAdmin) ^
      const DeepCollectionEquality().hash(becameAdmin);

  @JsonKey(ignore: true)
  @override
  _$BecomeAdminStateCopyWith<_BecomeAdminState> get copyWith =>
      __$BecomeAdminStateCopyWithImpl<_BecomeAdminState>(this, _$identity);
}

abstract class _BecomeAdminState implements BecomeAdminState {
  const factory _BecomeAdminState(
      {String code,
      bool loadingBecomeAdmin,
      String errBecomingAdmin,
      bool becameAdmin}) = _$_BecomeAdminState;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  bool get loadingBecomeAdmin => throw _privateConstructorUsedError;
  @override
  String get errBecomingAdmin => throw _privateConstructorUsedError;
  @override
  bool get becameAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BecomeAdminStateCopyWith<_BecomeAdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

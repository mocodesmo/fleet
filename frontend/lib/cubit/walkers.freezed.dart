// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'walkers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WalkersStateTearOff {
  const _$WalkersStateTearOff();

  _WalkersState call(
      {List<User> walkers = const [],
      bool loadingWalkers = false,
      String errLoadingWalkers = ''}) {
    return _WalkersState(
      walkers: walkers,
      loadingWalkers: loadingWalkers,
      errLoadingWalkers: errLoadingWalkers,
    );
  }
}

/// @nodoc
const $WalkersState = _$WalkersStateTearOff();

/// @nodoc
mixin _$WalkersState {
  List<User> get walkers => throw _privateConstructorUsedError;
  bool get loadingWalkers => throw _privateConstructorUsedError;
  String get errLoadingWalkers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalkersStateCopyWith<WalkersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkersStateCopyWith<$Res> {
  factory $WalkersStateCopyWith(
          WalkersState value, $Res Function(WalkersState) then) =
      _$WalkersStateCopyWithImpl<$Res>;
  $Res call(
      {List<User> walkers, bool loadingWalkers, String errLoadingWalkers});
}

/// @nodoc
class _$WalkersStateCopyWithImpl<$Res> implements $WalkersStateCopyWith<$Res> {
  _$WalkersStateCopyWithImpl(this._value, this._then);

  final WalkersState _value;
  // ignore: unused_field
  final $Res Function(WalkersState) _then;

  @override
  $Res call({
    Object? walkers = freezed,
    Object? loadingWalkers = freezed,
    Object? errLoadingWalkers = freezed,
  }) {
    return _then(_value.copyWith(
      walkers: walkers == freezed
          ? _value.walkers
          : walkers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      loadingWalkers: loadingWalkers == freezed
          ? _value.loadingWalkers
          : loadingWalkers // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingWalkers: errLoadingWalkers == freezed
          ? _value.errLoadingWalkers
          : errLoadingWalkers // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WalkersStateCopyWith<$Res>
    implements $WalkersStateCopyWith<$Res> {
  factory _$WalkersStateCopyWith(
          _WalkersState value, $Res Function(_WalkersState) then) =
      __$WalkersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<User> walkers, bool loadingWalkers, String errLoadingWalkers});
}

/// @nodoc
class __$WalkersStateCopyWithImpl<$Res> extends _$WalkersStateCopyWithImpl<$Res>
    implements _$WalkersStateCopyWith<$Res> {
  __$WalkersStateCopyWithImpl(
      _WalkersState _value, $Res Function(_WalkersState) _then)
      : super(_value, (v) => _then(v as _WalkersState));

  @override
  _WalkersState get _value => super._value as _WalkersState;

  @override
  $Res call({
    Object? walkers = freezed,
    Object? loadingWalkers = freezed,
    Object? errLoadingWalkers = freezed,
  }) {
    return _then(_WalkersState(
      walkers: walkers == freezed
          ? _value.walkers
          : walkers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      loadingWalkers: loadingWalkers == freezed
          ? _value.loadingWalkers
          : loadingWalkers // ignore: cast_nullable_to_non_nullable
              as bool,
      errLoadingWalkers: errLoadingWalkers == freezed
          ? _value.errLoadingWalkers
          : errLoadingWalkers // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WalkersState extends _WalkersState {
  const _$_WalkersState(
      {this.walkers = const [],
      this.loadingWalkers = false,
      this.errLoadingWalkers = ''})
      : super._();

  @JsonKey(defaultValue: const [])
  @override
  final List<User> walkers;
  @JsonKey(defaultValue: false)
  @override
  final bool loadingWalkers;
  @JsonKey(defaultValue: '')
  @override
  final String errLoadingWalkers;

  @override
  String toString() {
    return 'WalkersState(walkers: $walkers, loadingWalkers: $loadingWalkers, errLoadingWalkers: $errLoadingWalkers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WalkersState &&
            (identical(other.walkers, walkers) ||
                const DeepCollectionEquality()
                    .equals(other.walkers, walkers)) &&
            (identical(other.loadingWalkers, loadingWalkers) ||
                const DeepCollectionEquality()
                    .equals(other.loadingWalkers, loadingWalkers)) &&
            (identical(other.errLoadingWalkers, errLoadingWalkers) ||
                const DeepCollectionEquality()
                    .equals(other.errLoadingWalkers, errLoadingWalkers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(walkers) ^
      const DeepCollectionEquality().hash(loadingWalkers) ^
      const DeepCollectionEquality().hash(errLoadingWalkers);

  @JsonKey(ignore: true)
  @override
  _$WalkersStateCopyWith<_WalkersState> get copyWith =>
      __$WalkersStateCopyWithImpl<_WalkersState>(this, _$identity);
}

abstract class _WalkersState extends WalkersState {
  const factory _WalkersState(
      {List<User> walkers,
      bool loadingWalkers,
      String errLoadingWalkers}) = _$_WalkersState;
  const _WalkersState._() : super._();

  @override
  List<User> get walkers => throw _privateConstructorUsedError;
  @override
  bool get loadingWalkers => throw _privateConstructorUsedError;
  @override
  String get errLoadingWalkers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalkersStateCopyWith<_WalkersState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerStateTearOff {
  const _$ServerStateTearOff();

  _ServerState call({String url = ''}) {
    return _ServerState(
      url: url,
    );
  }
}

/// @nodoc
const $ServerState = _$ServerStateTearOff();

/// @nodoc
mixin _$ServerState {
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerStateCopyWith<ServerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStateCopyWith<$Res> {
  factory $ServerStateCopyWith(
          ServerState value, $Res Function(ServerState) then) =
      _$ServerStateCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class _$ServerStateCopyWithImpl<$Res> implements $ServerStateCopyWith<$Res> {
  _$ServerStateCopyWithImpl(this._value, this._then);

  final ServerState _value;
  // ignore: unused_field
  final $Res Function(ServerState) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ServerStateCopyWith<$Res>
    implements $ServerStateCopyWith<$Res> {
  factory _$ServerStateCopyWith(
          _ServerState value, $Res Function(_ServerState) then) =
      __$ServerStateCopyWithImpl<$Res>;
  @override
  $Res call({String url});
}

/// @nodoc
class __$ServerStateCopyWithImpl<$Res> extends _$ServerStateCopyWithImpl<$Res>
    implements _$ServerStateCopyWith<$Res> {
  __$ServerStateCopyWithImpl(
      _ServerState _value, $Res Function(_ServerState) _then)
      : super(_value, (v) => _then(v as _ServerState));

  @override
  _ServerState get _value => super._value as _ServerState;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_ServerState(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerState implements _ServerState {
  const _$_ServerState({this.url = ''});

  @JsonKey(defaultValue: '')
  @override
  final String url;

  @override
  String toString() {
    return 'ServerState(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerState &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$ServerStateCopyWith<_ServerState> get copyWith =>
      __$ServerStateCopyWithImpl<_ServerState>(this, _$identity);
}

abstract class _ServerState implements ServerState {
  const factory _ServerState({String url}) = _$_ServerState;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerStateCopyWith<_ServerState> get copyWith =>
      throw _privateConstructorUsedError;
}

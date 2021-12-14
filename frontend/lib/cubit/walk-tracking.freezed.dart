// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'walk-tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WalkTrackingStateTearOff {
  const _$WalkTrackingStateTearOff();

  _WalkTrackingState call(
      {bool socketConnected = false,
      bool connectingSocket = false,
      String errSocket = '',
      bool walkCompleted = false,
      Walk? walk,
      GoogleMapController? mapController}) {
    return _WalkTrackingState(
      socketConnected: socketConnected,
      connectingSocket: connectingSocket,
      errSocket: errSocket,
      walkCompleted: walkCompleted,
      walk: walk,
      mapController: mapController,
    );
  }
}

/// @nodoc
const $WalkTrackingState = _$WalkTrackingStateTearOff();

/// @nodoc
mixin _$WalkTrackingState {
  bool get socketConnected => throw _privateConstructorUsedError;
  bool get connectingSocket => throw _privateConstructorUsedError;
  String get errSocket => throw _privateConstructorUsedError;
  bool get walkCompleted => throw _privateConstructorUsedError;
  Walk? get walk => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalkTrackingStateCopyWith<WalkTrackingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkTrackingStateCopyWith<$Res> {
  factory $WalkTrackingStateCopyWith(
          WalkTrackingState value, $Res Function(WalkTrackingState) then) =
      _$WalkTrackingStateCopyWithImpl<$Res>;
  $Res call(
      {bool socketConnected,
      bool connectingSocket,
      String errSocket,
      bool walkCompleted,
      Walk? walk,
      GoogleMapController? mapController});

  $WalkCopyWith<$Res>? get walk;
}

/// @nodoc
class _$WalkTrackingStateCopyWithImpl<$Res>
    implements $WalkTrackingStateCopyWith<$Res> {
  _$WalkTrackingStateCopyWithImpl(this._value, this._then);

  final WalkTrackingState _value;
  // ignore: unused_field
  final $Res Function(WalkTrackingState) _then;

  @override
  $Res call({
    Object? socketConnected = freezed,
    Object? connectingSocket = freezed,
    Object? errSocket = freezed,
    Object? walkCompleted = freezed,
    Object? walk = freezed,
    Object? mapController = freezed,
  }) {
    return _then(_value.copyWith(
      socketConnected: socketConnected == freezed
          ? _value.socketConnected
          : socketConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      connectingSocket: connectingSocket == freezed
          ? _value.connectingSocket
          : connectingSocket // ignore: cast_nullable_to_non_nullable
              as bool,
      errSocket: errSocket == freezed
          ? _value.errSocket
          : errSocket // ignore: cast_nullable_to_non_nullable
              as String,
      walkCompleted: walkCompleted == freezed
          ? _value.walkCompleted
          : walkCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      walk: walk == freezed
          ? _value.walk
          : walk // ignore: cast_nullable_to_non_nullable
              as Walk?,
      mapController: mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
    ));
  }

  @override
  $WalkCopyWith<$Res>? get walk {
    if (_value.walk == null) {
      return null;
    }

    return $WalkCopyWith<$Res>(_value.walk!, (value) {
      return _then(_value.copyWith(walk: value));
    });
  }
}

/// @nodoc
abstract class _$WalkTrackingStateCopyWith<$Res>
    implements $WalkTrackingStateCopyWith<$Res> {
  factory _$WalkTrackingStateCopyWith(
          _WalkTrackingState value, $Res Function(_WalkTrackingState) then) =
      __$WalkTrackingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool socketConnected,
      bool connectingSocket,
      String errSocket,
      bool walkCompleted,
      Walk? walk,
      GoogleMapController? mapController});

  @override
  $WalkCopyWith<$Res>? get walk;
}

/// @nodoc
class __$WalkTrackingStateCopyWithImpl<$Res>
    extends _$WalkTrackingStateCopyWithImpl<$Res>
    implements _$WalkTrackingStateCopyWith<$Res> {
  __$WalkTrackingStateCopyWithImpl(
      _WalkTrackingState _value, $Res Function(_WalkTrackingState) _then)
      : super(_value, (v) => _then(v as _WalkTrackingState));

  @override
  _WalkTrackingState get _value => super._value as _WalkTrackingState;

  @override
  $Res call({
    Object? socketConnected = freezed,
    Object? connectingSocket = freezed,
    Object? errSocket = freezed,
    Object? walkCompleted = freezed,
    Object? walk = freezed,
    Object? mapController = freezed,
  }) {
    return _then(_WalkTrackingState(
      socketConnected: socketConnected == freezed
          ? _value.socketConnected
          : socketConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      connectingSocket: connectingSocket == freezed
          ? _value.connectingSocket
          : connectingSocket // ignore: cast_nullable_to_non_nullable
              as bool,
      errSocket: errSocket == freezed
          ? _value.errSocket
          : errSocket // ignore: cast_nullable_to_non_nullable
              as String,
      walkCompleted: walkCompleted == freezed
          ? _value.walkCompleted
          : walkCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      walk: walk == freezed
          ? _value.walk
          : walk // ignore: cast_nullable_to_non_nullable
              as Walk?,
      mapController: mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
    ));
  }
}

/// @nodoc

class _$_WalkTrackingState implements _WalkTrackingState {
  const _$_WalkTrackingState(
      {this.socketConnected = false,
      this.connectingSocket = false,
      this.errSocket = '',
      this.walkCompleted = false,
      this.walk,
      this.mapController});

  @JsonKey(defaultValue: false)
  @override
  final bool socketConnected;
  @JsonKey(defaultValue: false)
  @override
  final bool connectingSocket;
  @JsonKey(defaultValue: '')
  @override
  final String errSocket;
  @JsonKey(defaultValue: false)
  @override
  final bool walkCompleted;
  @override
  final Walk? walk;
  @override
  final GoogleMapController? mapController;

  @override
  String toString() {
    return 'WalkTrackingState(socketConnected: $socketConnected, connectingSocket: $connectingSocket, errSocket: $errSocket, walkCompleted: $walkCompleted, walk: $walk, mapController: $mapController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WalkTrackingState &&
            (identical(other.socketConnected, socketConnected) ||
                const DeepCollectionEquality()
                    .equals(other.socketConnected, socketConnected)) &&
            (identical(other.connectingSocket, connectingSocket) ||
                const DeepCollectionEquality()
                    .equals(other.connectingSocket, connectingSocket)) &&
            (identical(other.errSocket, errSocket) ||
                const DeepCollectionEquality()
                    .equals(other.errSocket, errSocket)) &&
            (identical(other.walkCompleted, walkCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.walkCompleted, walkCompleted)) &&
            (identical(other.walk, walk) ||
                const DeepCollectionEquality().equals(other.walk, walk)) &&
            (identical(other.mapController, mapController) ||
                const DeepCollectionEquality()
                    .equals(other.mapController, mapController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(socketConnected) ^
      const DeepCollectionEquality().hash(connectingSocket) ^
      const DeepCollectionEquality().hash(errSocket) ^
      const DeepCollectionEquality().hash(walkCompleted) ^
      const DeepCollectionEquality().hash(walk) ^
      const DeepCollectionEquality().hash(mapController);

  @JsonKey(ignore: true)
  @override
  _$WalkTrackingStateCopyWith<_WalkTrackingState> get copyWith =>
      __$WalkTrackingStateCopyWithImpl<_WalkTrackingState>(this, _$identity);
}

abstract class _WalkTrackingState implements WalkTrackingState {
  const factory _WalkTrackingState(
      {bool socketConnected,
      bool connectingSocket,
      String errSocket,
      bool walkCompleted,
      Walk? walk,
      GoogleMapController? mapController}) = _$_WalkTrackingState;

  @override
  bool get socketConnected => throw _privateConstructorUsedError;
  @override
  bool get connectingSocket => throw _privateConstructorUsedError;
  @override
  String get errSocket => throw _privateConstructorUsedError;
  @override
  bool get walkCompleted => throw _privateConstructorUsedError;
  @override
  Walk? get walk => throw _privateConstructorUsedError;
  @override
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalkTrackingStateCopyWith<_WalkTrackingState> get copyWith =>
      throw _privateConstructorUsedError;
}

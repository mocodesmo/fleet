// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'walk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call({required Loc location, required Time time}) {
    return _Location(
      location: location,
      time: time,
    );
  }

  Location fromJson(Map<String, Object> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
// required double lat,
// required double long,
  Loc get location => throw _privateConstructorUsedError;
  Time get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({Loc location, Time time});

  $LocCopyWith<$Res> get location;
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Loc,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
    ));
  }

  @override
  $LocCopyWith<$Res> get location {
    return $LocCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $TimeCopyWith<$Res> get time {
    return $TimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value));
    });
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({Loc location, Time time});

  @override
  $LocCopyWith<$Res> get location;
  @override
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? location = freezed,
    Object? time = freezed,
  }) {
    return _then(_Location(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Loc,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location({required this.location, required this.time});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override // required double lat,
// required double long,
  final Loc location;
  @override
  final Time time;

  @override
  String toString() {
    return 'Location(location: $location, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(time);

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location({required Loc location, required Time time}) =
      _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override // required double lat,
// required double long,
  Loc get location => throw _privateConstructorUsedError;
  @override
  Time get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}

Walk _$WalkFromJson(Map<String, dynamic> json) {
  return _Walk.fromJson(json);
}

/// @nodoc
class _$WalkTearOff {
  const _$WalkTearOff();

  _Walk call(
      {@JsonKey(name: 'start_time') required Time startTime,
      @JsonKey(name: 'end_time') Time? endTime,
      List<Location>? route}) {
    return _Walk(
      startTime: startTime,
      endTime: endTime,
      route: route,
    );
  }

  Walk fromJson(Map<String, Object> json) {
    return Walk.fromJson(json);
  }
}

/// @nodoc
const $Walk = _$WalkTearOff();

/// @nodoc
mixin _$Walk {
  @JsonKey(name: 'start_time')
  Time get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  Time? get endTime => throw _privateConstructorUsedError;
  List<Location>? get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalkCopyWith<Walk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkCopyWith<$Res> {
  factory $WalkCopyWith(Walk value, $Res Function(Walk) then) =
      _$WalkCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'start_time') Time startTime,
      @JsonKey(name: 'end_time') Time? endTime,
      List<Location>? route});

  $TimeCopyWith<$Res> get startTime;
  $TimeCopyWith<$Res>? get endTime;
}

/// @nodoc
class _$WalkCopyWithImpl<$Res> implements $WalkCopyWith<$Res> {
  _$WalkCopyWithImpl(this._value, this._then);

  final Walk _value;
  // ignore: unused_field
  final $Res Function(Walk) _then;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? route = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Time,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Time?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Location>?,
    ));
  }

  @override
  $TimeCopyWith<$Res> get startTime {
    return $TimeCopyWith<$Res>(_value.startTime, (value) {
      return _then(_value.copyWith(startTime: value));
    });
  }

  @override
  $TimeCopyWith<$Res>? get endTime {
    if (_value.endTime == null) {
      return null;
    }

    return $TimeCopyWith<$Res>(_value.endTime!, (value) {
      return _then(_value.copyWith(endTime: value));
    });
  }
}

/// @nodoc
abstract class _$WalkCopyWith<$Res> implements $WalkCopyWith<$Res> {
  factory _$WalkCopyWith(_Walk value, $Res Function(_Walk) then) =
      __$WalkCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'start_time') Time startTime,
      @JsonKey(name: 'end_time') Time? endTime,
      List<Location>? route});

  @override
  $TimeCopyWith<$Res> get startTime;
  @override
  $TimeCopyWith<$Res>? get endTime;
}

/// @nodoc
class __$WalkCopyWithImpl<$Res> extends _$WalkCopyWithImpl<$Res>
    implements _$WalkCopyWith<$Res> {
  __$WalkCopyWithImpl(_Walk _value, $Res Function(_Walk) _then)
      : super(_value, (v) => _then(v as _Walk));

  @override
  _Walk get _value => super._value as _Walk;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? route = freezed,
  }) {
    return _then(_Walk(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Time,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Time?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Location>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Walk extends _Walk {
  const _$_Walk(
      {@JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.route})
      : super._();

  factory _$_Walk.fromJson(Map<String, dynamic> json) => _$$_WalkFromJson(json);

  @override
  @JsonKey(name: 'start_time')
  final Time startTime;
  @override
  @JsonKey(name: 'end_time')
  final Time? endTime;
  @override
  final List<Location>? route;

  @override
  String toString() {
    return 'Walk(startTime: $startTime, endTime: $endTime, route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Walk &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$WalkCopyWith<_Walk> get copyWith =>
      __$WalkCopyWithImpl<_Walk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalkToJson(this);
  }
}

abstract class _Walk extends Walk {
  const factory _Walk(
      {@JsonKey(name: 'start_time') required Time startTime,
      @JsonKey(name: 'end_time') Time? endTime,
      List<Location>? route}) = _$_Walk;
  const _Walk._() : super._();

  factory _Walk.fromJson(Map<String, dynamic> json) = _$_Walk.fromJson;

  @override
  @JsonKey(name: 'start_time')
  Time get startTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_time')
  Time? get endTime => throw _privateConstructorUsedError;
  @override
  List<Location>? get route => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalkCopyWith<_Walk> get copyWith => throw _privateConstructorUsedError;
}

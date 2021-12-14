// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mongo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Id _$IdFromJson(Map<String, dynamic> json) {
  return _Id.fromJson(json);
}

/// @nodoc
class _$IdTearOff {
  const _$IdTearOff();

  _Id call({@JsonKey(name: '\$oid') required String id}) {
    return _Id(
      id: id,
    );
  }

  Id fromJson(Map<String, Object> json) {
    return Id.fromJson(json);
  }
}

/// @nodoc
const $Id = _$IdTearOff();

/// @nodoc
mixin _$Id {
  @JsonKey(name: '\$oid')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdCopyWith<Id> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdCopyWith<$Res> {
  factory $IdCopyWith(Id value, $Res Function(Id) then) =
      _$IdCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '\$oid') String id});
}

/// @nodoc
class _$IdCopyWithImpl<$Res> implements $IdCopyWith<$Res> {
  _$IdCopyWithImpl(this._value, this._then);

  final Id _value;
  // ignore: unused_field
  final $Res Function(Id) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IdCopyWith<$Res> implements $IdCopyWith<$Res> {
  factory _$IdCopyWith(_Id value, $Res Function(_Id) then) =
      __$IdCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '\$oid') String id});
}

/// @nodoc
class __$IdCopyWithImpl<$Res> extends _$IdCopyWithImpl<$Res>
    implements _$IdCopyWith<$Res> {
  __$IdCopyWithImpl(_Id _value, $Res Function(_Id) _then)
      : super(_value, (v) => _then(v as _Id));

  @override
  _Id get _value => super._value as _Id;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Id(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Id implements _Id {
  const _$_Id({@JsonKey(name: '\$oid') required this.id});

  factory _$_Id.fromJson(Map<String, dynamic> json) => _$$_IdFromJson(json);

  @override
  @JsonKey(name: '\$oid')
  final String id;

  @override
  String toString() {
    return 'Id(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Id &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$IdCopyWith<_Id> get copyWith => __$IdCopyWithImpl<_Id>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdToJson(this);
  }
}

abstract class _Id implements Id {
  const factory _Id({@JsonKey(name: '\$oid') required String id}) = _$_Id;

  factory _Id.fromJson(Map<String, dynamic> json) = _$_Id.fromJson;

  @override
  @JsonKey(name: '\$oid')
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdCopyWith<_Id> get copyWith => throw _privateConstructorUsedError;
}

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
class _$TimeTearOff {
  const _$TimeTearOff();

  _Time call({@JsonKey(name: '\$date') required int time}) {
    return _Time(
      time: time,
    );
  }

  Time fromJson(Map<String, Object> json) {
    return Time.fromJson(json);
  }
}

/// @nodoc
const $Time = _$TimeTearOff();

/// @nodoc
mixin _$Time {
  @JsonKey(name: '\$date')
  int get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '\$date') int time});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res> implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  final Time _value;
  // ignore: unused_field
  final $Res Function(Time) _then;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$TimeCopyWith(_Time value, $Res Function(_Time) then) =
      __$TimeCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '\$date') int time});
}

/// @nodoc
class __$TimeCopyWithImpl<$Res> extends _$TimeCopyWithImpl<$Res>
    implements _$TimeCopyWith<$Res> {
  __$TimeCopyWithImpl(_Time _value, $Res Function(_Time) _then)
      : super(_value, (v) => _then(v as _Time));

  @override
  _Time get _value => super._value as _Time;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_Time(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Time implements _Time {
  const _$_Time({@JsonKey(name: '\$date') required this.time});

  factory _$_Time.fromJson(Map<String, dynamic> json) => _$$_TimeFromJson(json);

  @override
  @JsonKey(name: '\$date')
  final int time;

  @override
  String toString() {
    return 'Time(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Time &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(time);

  @JsonKey(ignore: true)
  @override
  _$TimeCopyWith<_Time> get copyWith =>
      __$TimeCopyWithImpl<_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeToJson(this);
  }
}

abstract class _Time implements Time {
  const factory _Time({@JsonKey(name: '\$date') required int time}) = _$_Time;

  factory _Time.fromJson(Map<String, dynamic> json) = _$_Time.fromJson;

  @override
  @JsonKey(name: '\$date')
  int get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimeCopyWith<_Time> get copyWith => throw _privateConstructorUsedError;
}

Loc _$LocFromJson(Map<String, dynamic> json) {
  return _Loc.fromJson(json);
}

/// @nodoc
class _$LocTearOff {
  const _$LocTearOff();

  _Loc call({required String type, required List<double> coordinates}) {
    return _Loc(
      type: type,
      coordinates: coordinates,
    );
  }

  Loc fromJson(Map<String, Object> json) {
    return Loc.fromJson(json);
  }
}

/// @nodoc
const $Loc = _$LocTearOff();

/// @nodoc
mixin _$Loc {
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocCopyWith<Loc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocCopyWith<$Res> {
  factory $LocCopyWith(Loc value, $Res Function(Loc) then) =
      _$LocCopyWithImpl<$Res>;
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$LocCopyWithImpl<$Res> implements $LocCopyWith<$Res> {
  _$LocCopyWithImpl(this._value, this._then);

  final Loc _value;
  // ignore: unused_field
  final $Res Function(Loc) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
abstract class _$LocCopyWith<$Res> implements $LocCopyWith<$Res> {
  factory _$LocCopyWith(_Loc value, $Res Function(_Loc) then) =
      __$LocCopyWithImpl<$Res>;
  @override
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$LocCopyWithImpl<$Res> extends _$LocCopyWithImpl<$Res>
    implements _$LocCopyWith<$Res> {
  __$LocCopyWithImpl(_Loc _value, $Res Function(_Loc) _then)
      : super(_value, (v) => _then(v as _Loc));

  @override
  _Loc get _value => super._value as _Loc;

  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_Loc(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Loc extends _Loc {
  const _$_Loc({required this.type, required this.coordinates}) : super._();

  factory _$_Loc.fromJson(Map<String, dynamic> json) => _$$_LocFromJson(json);

  @override
  final String type;
  @override
  final List<double> coordinates;

  @override
  String toString() {
    return 'Loc(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loc &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.coordinates, coordinates) ||
                const DeepCollectionEquality()
                    .equals(other.coordinates, coordinates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(coordinates);

  @JsonKey(ignore: true)
  @override
  _$LocCopyWith<_Loc> get copyWith =>
      __$LocCopyWithImpl<_Loc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocToJson(this);
  }
}

abstract class _Loc extends Loc {
  const factory _Loc(
      {required String type, required List<double> coordinates}) = _$_Loc;
  const _Loc._() : super._();

  factory _Loc.fromJson(Map<String, dynamic> json) = _$_Loc.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  List<double> get coordinates => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocCopyWith<_Loc> get copyWith => throw _privateConstructorUsedError;
}

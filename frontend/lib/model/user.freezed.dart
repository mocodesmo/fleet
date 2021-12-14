// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@JsonKey(name: '_id') required Id id,
      required String phone,
      @JsonKey(name: 'is_admin') required bool isAdmin,
      @JsonKey(name: 'is_walking') required bool isWalking,
      Walk? currentWalk,
      List<Walk>? walks}) {
    return _User(
      id: id,
      phone: phone,
      isAdmin: isAdmin,
      isWalking: isWalking,
      currentWalk: currentWalk,
      walks: walks,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  Id get id => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_walking')
  bool get isWalking => throw _privateConstructorUsedError;
  Walk? get currentWalk => throw _privateConstructorUsedError;
  List<Walk>? get walks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') Id id,
      String phone,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'is_walking') bool isWalking,
      Walk? currentWalk,
      List<Walk>? walks});

  $IdCopyWith<$Res> get id;
  $WalkCopyWith<$Res>? get currentWalk;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? isAdmin = freezed,
    Object? isWalking = freezed,
    Object? currentWalk = freezed,
    Object? walks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isWalking: isWalking == freezed
          ? _value.isWalking
          : isWalking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWalk: currentWalk == freezed
          ? _value.currentWalk
          : currentWalk // ignore: cast_nullable_to_non_nullable
              as Walk?,
      walks: walks == freezed
          ? _value.walks
          : walks // ignore: cast_nullable_to_non_nullable
              as List<Walk>?,
    ));
  }

  @override
  $IdCopyWith<$Res> get id {
    return $IdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $WalkCopyWith<$Res>? get currentWalk {
    if (_value.currentWalk == null) {
      return null;
    }

    return $WalkCopyWith<$Res>(_value.currentWalk!, (value) {
      return _then(_value.copyWith(currentWalk: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') Id id,
      String phone,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'is_walking') bool isWalking,
      Walk? currentWalk,
      List<Walk>? walks});

  @override
  $IdCopyWith<$Res> get id;
  @override
  $WalkCopyWith<$Res>? get currentWalk;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? isAdmin = freezed,
    Object? isWalking = freezed,
    Object? currentWalk = freezed,
    Object? walks = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isWalking: isWalking == freezed
          ? _value.isWalking
          : isWalking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWalk: currentWalk == freezed
          ? _value.currentWalk
          : currentWalk // ignore: cast_nullable_to_non_nullable
              as Walk?,
      walks: walks == freezed
          ? _value.walks
          : walks // ignore: cast_nullable_to_non_nullable
              as List<Walk>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {@JsonKey(name: '_id') required this.id,
      required this.phone,
      @JsonKey(name: 'is_admin') required this.isAdmin,
      @JsonKey(name: 'is_walking') required this.isWalking,
      this.currentWalk,
      this.walks})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: '_id')
  final Id id;
  @override
  final String phone;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'is_walking')
  final bool isWalking;
  @override
  final Walk? currentWalk;
  @override
  final List<Walk>? walks;

  @override
  String toString() {
    return 'User(id: $id, phone: $phone, isAdmin: $isAdmin, isWalking: $isWalking, currentWalk: $currentWalk, walks: $walks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.isAdmin, isAdmin)) &&
            (identical(other.isWalking, isWalking) ||
                const DeepCollectionEquality()
                    .equals(other.isWalking, isWalking)) &&
            (identical(other.currentWalk, currentWalk) ||
                const DeepCollectionEquality()
                    .equals(other.currentWalk, currentWalk)) &&
            (identical(other.walks, walks) ||
                const DeepCollectionEquality().equals(other.walks, walks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      const DeepCollectionEquality().hash(isWalking) ^
      const DeepCollectionEquality().hash(currentWalk) ^
      const DeepCollectionEquality().hash(walks);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey(name: '_id') required Id id,
      required String phone,
      @JsonKey(name: 'is_admin') required bool isAdmin,
      @JsonKey(name: 'is_walking') required bool isWalking,
      Walk? currentWalk,
      List<Walk>? walks}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: '_id')
  Id get id => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_walking')
  bool get isWalking => throw _privateConstructorUsedError;
  @override
  Walk? get currentWalk => throw _privateConstructorUsedError;
  @override
  List<Walk>? get walks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

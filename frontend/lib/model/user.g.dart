// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: Id.fromJson(json['_id'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      isAdmin: json['is_admin'] as bool,
      isWalking: json['is_walking'] as bool,
      currentWalk: json['currentWalk'] == null
          ? null
          : Walk.fromJson(json['currentWalk'] as Map<String, dynamic>),
      walks: (json['walks'] as List<dynamic>?)
          ?.map((e) => Walk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'is_admin': instance.isAdmin,
      'is_walking': instance.isWalking,
      'currentWalk': instance.currentWalk,
      'walks': instance.walks,
    };

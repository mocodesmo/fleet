// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      location: Loc.fromJson(json['location'] as Map<String, dynamic>),
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'location': instance.location,
      'time': instance.time,
    };

_$_Walk _$$_WalkFromJson(Map<String, dynamic> json) => _$_Walk(
      startTime: Time.fromJson(json['start_time'] as Map<String, dynamic>),
      endTime: json['end_time'] == null
          ? null
          : Time.fromJson(json['end_time'] as Map<String, dynamic>),
      route: (json['route'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WalkToJson(_$_Walk instance) => <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'route': instance.route,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mongo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Id _$$_IdFromJson(Map<String, dynamic> json) => _$_Id(
      id: json[r'$oid'] as String,
    );

Map<String, dynamic> _$$_IdToJson(_$_Id instance) => <String, dynamic>{
      r'$oid': instance.id,
    };

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      time: json[r'$date'] as int,
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      r'$date': instance.time,
    };

_$_Loc _$$_LocFromJson(Map<String, dynamic> json) => _$_Loc(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_LocToJson(_$_Loc instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

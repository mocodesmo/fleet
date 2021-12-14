// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mongo.freezed.dart';
part 'mongo.g.dart';

@freezed
class Id with _$Id {
  const factory Id({
    @JsonKey(name: '\$oid') required String id,
  }) = _Id;

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({
    @JsonKey(name: '\$date') required int time,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@freezed
class Loc with _$Loc {
  const factory Loc({
    required String type,
    required List<double> coordinates,
  }) = _Loc;
  const Loc._();
  factory Loc.fromJson(Map<String, dynamic> json) => _$LocFromJson(json);

  double latitude() => coordinates[1];
  double longitude() => coordinates[0];
}

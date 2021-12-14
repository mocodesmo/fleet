// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/model/mongo.dart';

part 'walk.freezed.dart';
part 'walk.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    // required double lat,
    // required double long,
    required Loc location,
    required Time time,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Walk with _$Walk {
  const factory Walk({
    @JsonKey(name: 'start_time') required Time startTime,
    @JsonKey(name: 'end_time') Time? endTime,
    List<Location>? route,
  }) = _Walk;
  const Walk._();

  factory Walk.fromJson(Map<String, dynamic> json) => _$WalkFromJson(json);

  Polyline routeLine() {
    final List<LatLng> coords = [];
    if (route != null)
      for (final coo in route!)
        coords.add(
          LatLng(
            coo.location.latitude(),
            coo.location.longitude(),
          ),
        );

    final Polyline polyline = Polyline(
      polylineId: const PolylineId('poly'),
      // color: Colors.black,
      color: Colors.purple,
      width: 4,
      points: coords,
    );

    return polyline;
  }

  LatLng startLocation() {
    if (route == null || route!.isEmpty) return const LatLng(0, 0);
    return LatLng(
      route![0].location.latitude(),
      route![0].location.longitude(),
    );
  }

  LatLng lastLocation() {
    if (route == null || route!.isEmpty) return const LatLng(0, 0);
    final idx = route!.length - 1;
    return LatLng(route![idx].location.latitude(), route![idx].location.longitude());
  }

  String endTimeStr() {
    if (endTime != null)
      return DateTime.fromMillisecondsSinceEpoch(endTime!.time).toString();

    return 'No end time';
  }
}

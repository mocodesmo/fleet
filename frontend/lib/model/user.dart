// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/model/mongo.dart';
import 'package:fleet/model/walk.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required Id id,
    required String phone,
    @JsonKey(name: 'is_admin') required bool isAdmin,
    @JsonKey(name: 'is_walking') required bool isWalking,
    Walk? currentWalk,
    List<Walk>? walks,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  bool hasWalks() {
    if (walks == null || walks!.isEmpty) return false;
    return true;
  }

  Set<Polyline> routeLines() {
    if (walks == null) return <Polyline>{};

    final Set<Polyline> lines = {};

    for (final walk in walks!) {
      final List<LatLng> coords = [];
      if (walk.route != null)
        for (final coo in walk.route!)
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

      lines.add(polyline);
    }

    return lines;
  }
}

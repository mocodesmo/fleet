import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/cubit/walk-tracking.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';
import 'package:fleet/view/maps/live-one.dart';

class MapOldOne extends StatefulWidget {
  const MapOldOne({
    Key? key,
    required this.walk,
  }) : super(key: key);

  final Walk walk;

  @override
  State<MapOldOne> createState() => _MapOldOneState();
}

class _MapOldOneState extends State<MapOldOne> {
  // final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static const CameraPosition _kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Back(),
                ),
                const SizedBox(height: 40),
                Container(
                  width: context.width,
                  height: context.width,
                  color: context.colours.primary,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 17.0,
                      target: // LatLng(0, 0),
                          widget.walk.startLocation(),
                    ),
                    tiltGesturesEnabled: false,
                    polylines: <Polyline>{
                      widget.walk.routeLine(),
                    },
                    // onMapCreated: (GoogleMapController controller) async {
                    //   _controller.complete(controller);
                    //   await Future.delayed(const Duration(milliseconds: 1000));
                    //   _goToTheLake();
                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

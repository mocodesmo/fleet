import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/cubit/walk-tracking.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';
import 'package:fleet/view/tracking-page.dart';

class LiveTrack extends StatefulWidget {
  const LiveTrack({Key? key}) : super(key: key);

  @override
  State<LiveTrack> createState() => _LiveTrackState();
}

class _LiveTrackState extends State<LiveTrack> {
  // final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<WalkTrackingCubit>().disconnectSocket();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<WalkTrackingCubit, WalkTrackingState>(
            builder: (context, trackState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Back(
                        onTapped: () {
                          context.read<WalkTrackingCubit>().disconnectSocket();
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (trackState.walkCompleted) const Text('Completed'),
                    const SizedBox(height: 40),
                    if (trackState.socketConnected && trackState.walk != null)
                      Container(
                        width: context.width,
                        height: context.width,
                        color: context.colours.primary,
                        child: const LiveMap(),
                      ),
                    if (trackState.errSocket != '') Text(trackState.errSocket)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LiveMap extends StatelessWidget {
  const LiveMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalkTrackingCubit, WalkTrackingState>(
      listener: (context, state) {},
      builder: (context, trackState) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 17,
            target: trackState.walk!.lastLocation(),
          ),
          tiltGesturesEnabled: false,
          polylines: <Polyline>{
            trackState.walk!.routeLine(),
          },
          onMapCreated: (c) {
            context.read<WalkTrackingCubit>().initMapController(c);
          },
        );
      },
    );
  }
}

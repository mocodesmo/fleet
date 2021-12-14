import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/cubit/walk-tracking.dart';
import 'package:fleet/cubit/walkers.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';

class LiveAll extends StatelessWidget {
  const LiveAll();
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
    return BlocConsumer<WalkersCubit, WalkersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: const CameraPosition(
            zoom: 17,
            target: LatLng(18.9746, 72.8065),
          ),
          tiltGesturesEnabled: false,
          polylines: state.routeLines(),
          onMapCreated: (c) {
            context.read<WalkTrackingCubit>().initMapController(c);
          },
        );
      },
    );
  }
}

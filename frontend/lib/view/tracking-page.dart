import 'package:flutter/material.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/view/maps/live-one.dart';
import 'package:fleet/view/maps/old-one.dart';

// class TrackPage extends StatelessWidget {
//   const TrackPage({Key? key, this.walk}) : super(key: key);

//   final Walk? walk;

//   @override
//   Widget build(BuildContext context) {
//     if (walk != null)
//       return OldTrack(walk: walk!);
//     else
//       return const LiveTrack();
//   }
// }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//


// class TestMap extends StatefulWidget {
//   const TestMap({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TestMap> createState() => _TestMapState();
// }

// class _TestMapState extends State<TestMap> {
//   final Map<PolylineId, Polyline> _mapPolylines = {};
//   int _polylineIdCounter = 1;

//   void _add() async {
//     for (var i = 0; i < 1; i++) {
//       final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
//       _polylineIdCounter++;
//       final PolylineId polylineId = PolylineId(polylineIdVal);

//       final Polyline polyline = Polyline(
//         polylineId: polylineId,
//         consumeTapEvents: true,
//         color: Colors.purple,
//         width: 5,
//         geodesic: true,
//         jointType: JointType.round,
//         points: _createPoints(i),
//       );

//       setState(() {
//         _mapPolylines[polylineId] = polyline;
//       });
//       await Future.delayed(const Duration(milliseconds: 500));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         backgroundColor: Colors.white,
//         actions: <Widget>[
//           IconButton(icon: const Icon(Icons.add), onPressed: _add),
//         ],
//       ),
//       body: SafeArea(
//         child: GoogleMap(
//           // initialCameraPosition: const CameraPosition(
//           //   zoom: 17,
//           //   // bearing: 30,
//           //   // tilt: 0,
//           //   target: LatLng(18.9746, 72.8065),
//           //   // widget.walk.startLocation(),
//           // ),
//           // compassEnabled: true,
//           tiltGesturesEnabled: false,
//           initialCameraPosition: const CameraPosition(
//             target: LatLng(18.9746, 72.8065),
//             zoom: 17.0,
//           ),
//           polylines: Set<Polyline>.of(_mapPolylines.values),
//           // mapType: MapType.normal,
//           // polylines: widget.walk.polylineCoordinates(),
//           // onMapCreated: onMapCreated,
//         ),
//       ),
//     );
//   }
// }

// List<LatLng> _createPoints(int num) {
//   final List<LatLng> points = <LatLng>[];
//   if (num == 0) {
//     points.add(const LatLng(18.9746, 72.8065));
//     points.add(const LatLng(18.9746, 72.8075));
//     points.add(const LatLng(18.9546, 72.8085));
//     points.add(const LatLng(18.9746, 72.8095));
//     points.add(const LatLng(18.9746, 72.8105));
//     points.add(const LatLng(18.9746, 72.8115));
//   }
//   // if (num == 1) {
//   //   points.add(LatLng(18.9776, 72.8065));
//   //   points.add(LatLng(18.9756, 72.8075));
//   //   points.add(LatLng(18.9766, 72.8085));
//   //   points.add(LatLng(18.9776, 72.8095));
//   //   points.add(LatLng(18.9786, 72.8105));
//   //   points.add(LatLng(18.9796, 72.8115));
//   // }
//   // if (num == 2) {
//   //   points.add(LatLng(18.9756, 72.8065));
//   //   points.add(LatLng(18.9726, 72.8075));
//   //   points.add(LatLng(18.9546, 72.8085));
//   //   points.add(LatLng(18.9946, 72.8095));
//   //   points.add(LatLng(18.9346, 72.8105));
//   //   points.add(LatLng(18.9046, 72.8115));
//   // }
//   // if (num == 3) {
//   //   points.add(LatLng(18.9746, 72.8065));
//   //   points.add(LatLng(18.9446, 72.8075));
//   //   points.add(LatLng(18.9736, 72.8085));
//   //   points.add(LatLng(18.9546, 72.8095));
//   //   points.add(LatLng(18.9646, 72.8105));
//   //   points.add(LatLng(18.9846, 72.8115));
//   // }
//   return points;
// }

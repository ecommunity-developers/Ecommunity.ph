// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PolylineMapWidget extends StatefulWidget {
  const PolylineMapWidget({
    super.key,
    this.width,
    this.height,
    this.startLocation,
    this.endLocation,
    this.googleApiKey,
  });

  final double? width;
  final double? height;
  final LatLng? startLocation;
  final LatLng? endLocation;
  final String? googleApiKey;

  @override
  State<PolylineMapWidget> createState() => _PolylineMapWidgetState();
}

class _PolylineMapWidgetState extends State<PolylineMapWidget> {
//   late gmap.GoogleMapController mapController;
//   Set<gmap.Polyline> _polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     _getRouteBetweenLocations();
//   }

//   Future<void> _getRouteBetweenLocations() async {
//     if (widget.startLocation != null && widget.endLocation != null) {
//       final startLat = widget.startLocation!.latitude;
//       final startLng = widget.startLocation!.longitude;
//       final endLat = widget.endLocation!.latitude;
//       final endLng = widget.endLocation!.longitude;

//       final String url =
//           'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&key=AIzaSyAeyHRMQjVu4-1CPcAO3AhBvFo7rpVK0Zk';

//       try {
//         final response = await http.get(Uri.parse(url));
//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);

//           if (data['routes'] != null && data['routes'].isNotEmpty) {
//             final points = _decodePolyline(
//                 data['routes'][0]['overview_polyline']['points']);
//             _createPolylines(points);
//           } else {
//             print('No routes found in the response.');
//           }
//         } else {
//           print('Error fetching directions: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Exception occurred: $e');
//       }
//     } else {
//       print('Error: startLocation or endLocation is null');
//     }
//   }

//   List<gmap.LatLng> _decodePolyline(String polyline) {
//     List<gmap.LatLng> points = [];
//     int index = 0, len = polyline.length;
//     int lat = 0, lng = 0;

//     while (index < len) {
//       int shift = 0, result = 0;
//       int b;
//       do {
//         b = polyline.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lat += dlat;

//       shift = 0;
//       result = 0;
//       do {
//         b = polyline.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lng += dlng;

//       points.add(gmap.LatLng(lat / 1E5, lng / 1E5));
//     }
//     return points;
//   }

//   void _createPolylines(List<gmap.LatLng> points) {
//     setState(() {
//       _polylines.add(gmap.Polyline(
//         polylineId: gmap.PolylineId("route"),
//         points: points,
//         color: Colors.blue,
//         width: 5,
//       ));
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final startLocation = widget.startLocation;
    final endLocation = widget.endLocation;

    if (startLocation == null || endLocation == null) {
      return Center(child: Text('Error: startLocation or endLocation is null'));
    }

    return gmap.GoogleMap(
      // onMapCreated: (controller) {
      //   mapController = controller;
      // },
      initialCameraPosition: gmap.CameraPosition(
        target: gmap.LatLng(startLocation.latitude, startLocation.longitude),
        zoom: 12.0,
      ),
      // polylines: _polylines,
      // markers: {
      //   gmap.Marker(
      //       markerId: gmap.MarkerId("start"),
      //       position:
      //           gmap.LatLng(startLocation.latitude, startLocation.longitude)),
      //   gmap.Marker(
      //       markerId: gmap.MarkerId("end"),
      //       position: gmap.LatLng(endLocation.latitude, endLocation.longitude)),
      // },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

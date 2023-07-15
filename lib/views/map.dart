import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindMap extends StatefulWidget {
  const FindMap({super.key, required this.latlng});
  final Map<String, dynamic> latlng;
  @override
  State<FindMap> createState() => FindMapState();
}

class FindMapState extends State<FindMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _kGooglePlex;

  Set<Marker> marker = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    marker.add(const Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(37.43296265331129, -122.08832357078792),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    ));

    _kGooglePlex = CameraPosition(
      target: LatLng(widget.latlng['lat'], widget.latlng['lng']),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        compassEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex!,
        markers: marker,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

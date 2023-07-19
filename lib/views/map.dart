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
  Map<MarkerId, Marker> marker = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        compassEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex!,
        markers: marker.values.toSet(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  void getData() {
    final markerVal = Marker(
      markerId: const MarkerId('place'),
      position: LatLng(widget.latlng['lat'], widget.latlng['lng']),
      infoWindow: const InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    setState(() {
      marker[const MarkerId('place')] = markerVal;
    });
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.latlng['lat'], widget.latlng['lng']),
      zoom: 14.4746,
    );
  }
}

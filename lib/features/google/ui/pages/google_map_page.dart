import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  static const routeName = 'google-map';

  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final _initialCoords = const LatLng(54.946571, 73.377869);
  final _animatedCoords = const LatLng(55.008806, 73.351148);
  final _controller = Completer<GoogleMapController>();

  final Set<Marker> _markers = {};

  @override
  void initState() {
    _markers.addAll([
      Marker(
        markerId: const MarkerId('1'),
        position: _initialCoords,
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        infoWindow: const InfoWindow(title: 'Marker', snippet: 'Marker info'),
        draggable: true,
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: _animatedCoords,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: const InfoWindow(title: 'Marker', snippet: 'Marker info'),
        draggable: true,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Map')),
      body: GoogleMap(
        markers: _markers,
        initialCameraPosition:
            CameraPosition(zoom: 15.0, target: _initialCoords),
        onMapCreated: (controller) => _controller.complete(controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cameraAction,
        child: const Icon(Icons.location_city),
      ),
    );
  }

  void cameraAction() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 15.0, target: _animatedCoords)));
    // controller.moveCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(zoom: 15.0, target: _animatedCoords)));
  }
}

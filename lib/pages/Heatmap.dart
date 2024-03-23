import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Heatmap extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Heatmap> {
  Set<Marker> _markers = {};

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example location: San Francisco
    zoom: 11.0,
  );

  @override
  void initState() {
    super.initState();

    _markers.add(
      Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(37.7749, -122.4194), // Specific location
        infoWindow: InfoWindow(
          title: 'San Francisco',
          snippet: 'An interesting city',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
        markers: _markers,
      ),
    );
  }
}

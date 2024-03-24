import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shieldy/utils/colors.dart';

class Heatmap extends StatefulWidget {
  final LatLng? initialPosition;

  const Heatmap({Key? key, this.initialPosition}) : super(key: key);

  @override
  _HeatmapState createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  Set<Marker> _markers = {};
  late GoogleMapController mapController;
  late LatLng _initialPosition;
  Marker? _initialMarker;




  @override
  void initState() {
    super.initState();
    _initialPosition = widget.initialPosition ?? const LatLng(11.6021526, 104.9112173);
    _fetchPosts();

    // Create the initial marker if initialPosition is provided
    if (widget.initialPosition != null) {
      _initialMarker = Marker(
        markerId: const MarkerId('initialPosition'),
        position: _initialPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            mobileBackgroundColor, // Ensure this color is defined or use a Color value directly
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
      
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.4746,
        ),
        markers: Set.from(_markers)
        ..addAll(_initialMarker != null ? [_initialMarker!] : [])
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _fetchPosts() async {
    final posts = await FirebaseFirestore.instance.collection('Posts').get();
    final newMarkers = <Marker>{};
    for (final post in posts.docs) {
      final lat = post.data()['lat'];
      final lng = post.data()['lng'];
      final marker = Marker(
        markerId: MarkerId(post.id),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: 'Post',
          snippet: post.data()['content'],
        ),
      );
      newMarkers.add(marker);
    }

    // Add the initial marker if it exists
    if (widget.initialPosition != null) {
      newMarkers.add(
        Marker(
          markerId: const MarkerId('initialPosition'),
          position: _initialPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

    setState(() {
      _markers = newMarkers;
    });
  }
}
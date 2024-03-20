// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappage extends StatefulWidget {
  const Mappage({Key? key}) : super(key: key);

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  String result = "";
  String lat = "";
  String lng = "";
  bool isLoading = false;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Heat Map",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: mobileBackgroundColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target:
                LatLng(0, 0), // Initial position, you might want to change this
            zoom: 14.4746,
          ),
          markers: _markers,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: 50.0), // Adjust this value as needed
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0), // Add this line
                    child: Image.asset("images/map.png"),
                  ),
                ),
              ),
              _getMapButton(),
              SizedBox(
                height: 20,
              ),
              _getLocationButton(),
              SizedBox(
                height: 20,
              ),
              displayLocation()
            ],
          ),
        )
      ],
    );
  }

  Widget _getMapButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          backgroundColor: Colors.blue,
          side: BorderSide(color: Colors.white, width: 2.0), // Add this line
        ),
        onPressed: () {
          gotoMap();
        },
        child: Text(
          "Go to Google Map",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getLocationButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.white, // Set border color
          width: 3.0, // Set border width
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set the button's border radius
          ),
        ),
        onPressed: () {
          getUserLocation();
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 10),
            Text(
              "Get Location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  //check if location permission is enable
  Future<bool> checkPermission() async {
    bool isEnable = false;
    LocationPermission permission;

    //check if location is enable
    isEnable = await Geolocator.isLocationServiceEnabled();
    if (!isEnable) {
      return false;
    }

    //check if use allow location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  //get user current location
  Future<void> getUserLocation() async {
    var isEnable = await checkPermission();
    if (isEnable) {
      Position location = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      Placemark place = placemarks[0];
      setState(() {
        result = "${place.locality}, ${place.country}";
        lat = location.latitude.toString();
        lng = location.longitude.toString();
        isLoading = false;
      });
    } else {
      setState(() {
        result = "Permission is not allowed";
        isLoading = false;
      });
    }
  }

  Widget displayLocation() {
    if (isLoading) {
      return CircularProgressIndicator(
        color: Colors.blue,
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.white, // Set border color
            width: 3.0, // Set border width
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              result,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Latitude: $lat",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Longitude: $lng",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Place: $result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
  }

  gotoMap() {
    try {
      var url =
          "https://www.google.com/maps/dir/?api=1&destination=11.6021526,104.9112173";
      final Uri _url = Uri.parse(url);
      launchUrl(_url);
    } catch (_) {
      print("Error launch Map");
    }
  }

  launchUrl(Uri url) async {
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  void _fetchPosts() async {
    final posts = await FirebaseFirestore.instance.collection('Posts').get();
    final newMarkers = <Marker>{};
    for (final post in posts.docs) {
      final lat = post.data()['lat']; // Replace 'lat' with your actual key
      final lng = post.data()['lng']; // Replace 'lng' with your actual key
      final marker = Marker(
        markerId: MarkerId(post.id),
        position: LatLng(lat, lng),
      );
      newMarkers.add(marker);
    }
    setState(() {
      _markers = newMarkers;
    });
  }
}

// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String result = "";
  String lat = "";
  String lng = "";
  bool isLoading = false;

  //Sign user out method
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USER CURRENT LOCATION"),
        centerTitle: true,
        backgroundColor: mobileBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          //Sign out button
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      ),
    );
  }

  Widget _getMapButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.white, width: 2), // Add this
        foregroundColor: Colors.black,
        fixedSize: Size(300, 50),
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        gotoMap();
      },
      child: Text(
        "Go to Google Map",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _getLocationButton() {
    return Tooltip(
      message: 'Click to get your current location',
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.white, width: 2), // Add this
          fixedSize: Size(300, 50),
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          getUserLocation();
        },
        icon: const Icon(Icons.location_on),
        label: Text(
          "Get Location",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      return LinearProgressIndicator();
    } else {
      return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            // Add this
            color: Colors.white,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                result,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Latitude: $lat",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Longitude: $lng",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Place: $result",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shieldy/pages/auth_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _redirectToAuthPage();
  }

  _redirectToAuthPage() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF090d3a), Color(0xFF090d3a)], // Change top and bottom color to #090d3a
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sheildy',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'adlamdisplay',
                  color: Color(0xFF848eff), // Change text color to #848eff
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/welcome.png', // Placeholder for Sheildy logo
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

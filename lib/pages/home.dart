import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  //Sign out method
  void signUserOut() async {
    // Add the sign out method here
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor, // Set background color here
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Implement the action when the profile icon is pressed
            },
          ),
          Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Implement the action when the notification icon is pressed
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout), // Add logout icon here
            onPressed: signUserOut, // Add the signUserOut function here, tell Nuwin to add this function in the settings
          ),
        ],
      ),
    );
  }
}

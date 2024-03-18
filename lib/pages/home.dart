import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';



class Homepage extends StatelessWidget {
  const Homepage({super.key});

  //Sign user out method
  Future<void> signUserOut(BuildContext context) async {
    // Clear the authentication state from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    
    await FirebaseAuth.instance.signOut();

    // Navigate back to login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
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
    const Spacer(),

    IconButton(
      icon: const Icon(Icons.notifications_none),
      onPressed: () {
        // Implement the action when the notification icon is pressed
      },
    ),

    //Sign out button
    IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () async {
        await signUserOut(context);
      },
      
    ),
  ],
      ),
      body:   const FeedContainer(),
);
}
}

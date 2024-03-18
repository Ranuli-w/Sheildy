import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';



class Homepage extends StatelessWidget {
  const Homepage({super.key});

  //Sign user out method
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
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
      onPressed: signUserOut,
      icon: const Icon(Icons.logout),
    ),
  ],
      ),
      body:   const FeedContainer(),
);
}
}

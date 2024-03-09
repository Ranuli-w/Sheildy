
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shieldy/utils/colors.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Implement the action when the profile icon is pressed
            },
          ),Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Implement the action when the notification icon is pressed
            },
          ),
        ],backgroundColor: mobileBackgroundColor
        
      ),backgroundColor: mobileBackgroundColor,
    );
  }
}


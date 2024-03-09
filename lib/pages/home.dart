
import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';



class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
  ],    
      ),
      body:   const FeedContainer(),
    );
  }
}


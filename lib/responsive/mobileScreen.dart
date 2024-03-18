

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shieldy/providers/UserProvider.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/utils/GlobalVariables.dart';
import 'package:shieldy/model/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {



  String username="";

  int _page = 0;
  late PageController pageController; //to get the  tabs animation

  @override
  void initState() {
    super.initState();
    getUsername();
    pageController = PageController();
  }

  void getUsername() async {
      DocumentSnapshot snap = await FirebaseFirestore.instance.collection("User_Details").doc(FirebaseAuth.instance.currentUser!.uid)
        .get();



    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }


//   void getUsername() async {
//   DocumentSnapshot? snap = await FirebaseFirestore.instance
//       .collection("User_Details")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get();

//   if (snap != null && snap.exists) {
//     setState(() {
//       username = (snap.data() as Map<String, dynamic>)['username'];
//     });
//   } else {
//     // Handle the case where data is null or does not exist
//   }
// }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void whenPageChanged(int page) {
    //colour change when page changes
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }



  

  @override
  Widget build(BuildContext context) {



    model.User user=Provider.of<UserProvider>(context).getUser;



    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: whenPageChanged,

        //children: [Text("feed page"),Text("map page"),Text(" camera page"),Text("phone page"),Text("settings page")],

        physics:
            const NeverScrollableScrollPhysics(),
        children: homeScreenItems, //stop scrolling of page by touching horizontally
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, // Home icon as the 1st
              color: (_page == 0) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map, // Map icon as the 2nd
              color: (_page == 1) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt, // Camera icon as the 3rd
              color: (_page == 2) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone, // Phone icon as the 4th
              color: (_page == 3) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings, // Settings icon as the 5th
              color: (_page == 4) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}

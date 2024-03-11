import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shieldy/pages/add_post_page.dart';
import 'package:shieldy/utils/colors.dart';

import 'package:shieldy/pages/home.dart';

const webScreenSize = 600;
const homeScreenItems = [
  Text('feed'),
  AddPostScreen(),

  //const AddPostScreen(),
  //const Text('notifications'),
  //ProfileScreen(

  // ...

  //uid: FirebaseAuth.instance.currentUser!.uid,
];

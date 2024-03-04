import 'package:flutter/material.dart';
import 'package:shieldy/responsive/mobileScreen.dart';
import 'package:shieldy/responsive/responsiveLayout.dart';
import 'package:shieldy/responsive/webScreen.dart';
import 'package:shieldy/utils/colors.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:shieldy/responsive/responsiveLayout.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const responsiveLayout(mobileScreenLayout:mobileScreenLayout() ,webScreenLayout:webScreenLayout(),)//ResponsiveLayout
      //Scaffold(body: LoginPage()), //LoginPage(),
    );
  }
}


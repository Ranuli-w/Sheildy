import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/pages/add_post_page.dart';

import 'package:shieldy/pages/home.dart';

 // Import the WelcomePage class
import 'package:firebase_core/firebase_core.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/pages/signup_screen.dart';
import 'package:shieldy/providers/UserProvider.dart';
import 'package:shieldy/responsive/mobileScreen.dart';
import 'package:shieldy/responsive/responsiveLayout.dart';
import 'package:shieldy/responsive/webScreen.dart';
import 'package:shieldy/utils/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Changed the home to WelcomePage
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
    );
  }
}
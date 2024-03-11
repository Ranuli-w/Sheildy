import 'package:flutter/material.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/pages/auth_page.dart';
import 'package:shieldy/pages/welcome_page.dart'; // Import the WelcomePage class
import 'package:firebase_core/firebase_core.dart';
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
      home: AccountScreen(),
      //theme: ThemeData.dark()
      //.copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      //home: const responsiveLayout(mobileScreenLayout:MobileScreenLayout() ,webScreenLayout:webScreenLayout(),)//ResponsiveLayout
    );
  }
}

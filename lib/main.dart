import 'package:flutter/material.dart';

// Import the WelcomePage class
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/providers/UserProvider.dart';
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AccountScreen(), // Changed the home to WelcomePage
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


 // Import the WelcomePage class
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shieldy/pages/login_screen.dart';
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MobileScreenLayout(), // Changed the home to WelcomePage
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
    );
  }
}



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserProvider(),),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'sheildy',
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: mobileBackgroundColor,
//         ),
//         home: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.active) {
//               // Checking if the snapshot has any data or not
//               if (snapshot.hasData) {
//                 // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
//                 return const responsiveLayout(
//                   mobileScreenLayout: MobileScreenLayout(),
//                   webScreenLayout: webScreenLayout(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('${snapshot.error}'),
//                 );
//               }
//             }

//             // means connection to future hasnt been made yet
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             return const MobileScreenLayout();
//           },
//         ),
//       ),
//     );
//   }
// }
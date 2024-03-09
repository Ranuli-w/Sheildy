import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shieldy/pages/login_page.dart';
import 'package:shieldy/pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData){
            return Homepage();
          }
          //user not logged in
          else {
            return LoginPage();
          }
        },
      )
    );
  }
}

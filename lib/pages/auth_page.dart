import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shieldy/pages/home.dart';
import 'package:shieldy/pages/login_or_register_page.dart';
import 'login_or_register_page.dart';

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
            return LoginOrRegisterPage(
              onTap:() {}
            );
          }
        },
      )
    );
  }
}
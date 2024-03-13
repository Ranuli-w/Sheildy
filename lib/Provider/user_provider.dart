import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:shieldy/model/user.dart';
import 'package:shieldy/pages/register_page.dart';
import 'package:shieldy/services/auth_service.dart';


class UserProvider with ChangeNotifier {
  auth.User? _user = FirebaseAuth.instance.currentUser;
  Firebase.instance.

  Future<void> refreshUser() async {
    auth.User user = FirebaseAuth.instance.currentUser!;
  }
}
  
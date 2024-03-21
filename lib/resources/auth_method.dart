import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shieldy/model/user.dart' as model;
import 'package:shieldy/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('User_Details').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

      // get user username
    Future<String> getUserUsername() async {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('User_Details').doc(currentUser.uid).get();
      return documentSnapshot.get('username');
    }


      // get user profile image URL
    Future<String> getUserProfileImageUrl() async {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('User_Details').doc(currentUser.uid).get();
      return documentSnapshot.get('photoUrl');
    }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String confirmPass,
    required String username,
    required Uint8List file,
    required String age,
    required String nic,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          age.isNotEmpty ||
          nic.isNotEmpty ||
          password == confirmPass ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          nic : nic,
          age: age,
        );

        // adding user in our database
        await _firestore
            .collection("User_Details")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  //logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  //Google Sign In
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //final, sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  //Facebook Sign In
  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  }

  //signing out user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/pages/login_screen.dart';
import 'package:shieldy/resources/auth_method.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/HOmemain_container.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // Create an instance of AuthMethods
  final AuthMethods _authMethods = AuthMethods();


  // Method to show loading dialog
  void _showLoadingDialog(BuildContext context) {
    print("Showing loading dialog");
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Signing out...'),
              ],
            ),
          ),
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: mobileBackgroundColor,
  title: StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      void printHelloUsername(String? username) {
    if (username != null) {
      print('Hello $username');
    } else {
      print('Hello user');
    }
  }
      if (snapshot.hasData) {
        final user = snapshot.data;
        return Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? ''),
            ),
            const SizedBox(width: 8.0),
            Text(user.displayName ?? ''),
          ],
        );
      } else {
        return const Text('');
      }
    },
  ),
  actions: [
    
    const Spacer(),
    IconButton(
      icon: const Icon(Icons.notifications_none),
      onPressed: () {
        // Implement notification functionality
      },
    ),
    IconButton(
      onPressed: () async {
        // Show loading dialog
        _showLoadingDialog(context);
        await Future.delayed(const Duration(seconds: 2));
        // Call sign out method
        await AuthMethods().signOut();
        // Close the loading dialog
        Navigator.of(context).pop();
        // Navigate to login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      icon: const Icon(Icons.logout),
    ),
  ],
),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Posts')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
  itemCount: snapshot.data!.docs.length,
  itemBuilder: (context, index) {
    // Sort the list of documents by the number of likes
    final sortedDocs = snapshot.data!.docs.toList()
      ..sort((a, b) => (b['likes'] as List).length.compareTo((a['likes'] as List).length));
    
    return FeedContainer(
      snap: sortedDocs[index].data(),
    );
  },
);
;
        },
      ),
    );
  }
}

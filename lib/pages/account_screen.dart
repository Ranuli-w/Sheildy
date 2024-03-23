import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shieldy/model/user.dart';
import 'package:shieldy/pages/edit_screen.dart';
import 'package:shieldy/pages/privacy@policy.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:shieldy/widgets/Forward_button.dart';
import 'package:shieldy/widgets/setting_item.dart';
import 'package:shieldy/widgets/setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;
  bool isSwitched = false;
  String name = ''; // Default name
  String imageUrl = ''; // Default image URL

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    auth.User? currentUser = auth.FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print('No user is signed in.');
      return;
    }
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('User_Details')
        .doc(currentUser.uid)
        .get();
    setState(() {
      name = doc['Name'];
      imageUrl = doc['Image'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? webBackgroundColor : mobileBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(50), // Half of width and height
                      child: imageUrl != ''
                          ? Image.network(
                              imageUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "images/Avatar1.png",
                              width: 100,
                              height: 100,
                            ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name, // Display the name
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "",
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(onTap: () async {
                      final newName = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAccountScreen(
                            initialName: name,
                          ),
                        ),
                      );
                      if (newName != null) {
                        setState(() {
                          name = newName; // Update the name
                        });
                      }
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Language",
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "English",
                onTap: () {},
                iconSize: 20,
              ),
              const SizedBox(height: 40),
              settingswitch(
                title: "Notifications",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                value: isSwitched,
                onTap: (bool value) {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
              ),
              const SizedBox(height: 40),
              settingswitch(
                title: "Light Mode",
                icon: Ionicons.sunny,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: isDarkMode,
                // ignore: non_constant_identifier_names
                onTap: (bool Value) {
                  setState(() {
                    isDarkMode = Value;
                  });
                },
              ),
              const SizedBox(height: 40),
              SettingItem(
                title: "Privacy and Policy",
                icon: Ionicons.help_circle_outline,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen()),
                  );
                },
                iconSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Setings_page.dart';
//import 'package:flutter_application_1/Settings_page.dart'; // Fixed typo in import statement

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/UI.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              buildTextField("Full Name", "Dor Alex", false),
              buildTextField("E-mail", "alexd@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "TLV, Israel", false),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 50),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 50),
                      ),
                      elevation: MaterialStateProperty.all<double>(2),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

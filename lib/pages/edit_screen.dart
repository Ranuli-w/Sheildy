import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shieldy/widgets/edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  final String initialName;

  const EditAccountScreen({Key? key, required this.initialName})
      : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "Man";
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _nicController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _nicController = TextEditingController();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('User_Details')
          .doc('RGkggwaiKniHFnWAX17w')
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        setState(() {
          _nameController.text = userData['Name'] ?? '';
          gender = userData['Gender'] ?? 'Man';
          _ageController.text =
              userData['Age'] != null ? userData['Age'].toString() : '';
          _emailController.text = userData['Email'] ?? '';
          _nicController.text = userData['NIC'] ?? '';
        });
      } else {
        print('User data not found');
      }
    } catch (error) {
      print("Error fetching user data: $error");
    }
  }

  Future<void> _updateUserData() async {
    try {
      await FirebaseFirestore.instance
          .collection('User_Details')
          .doc('RGkggwaiKniHFnWAX17w')
          .update({
        'Name': _nameController.text,
        'Gender': gender,
        'Age': int.tryParse(_ageController.text) ?? 0,
        'Email': _emailController.text,
        'NIC': _nicController.text,
      });
      print('User data updated successfully');
    } catch (error) {
      print('Error updating user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _updateUserData(); // Update the user data in Firestore
                  Navigator.pop(context, _nameController.text);
                }
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: const Size(50, 30),
                elevation: 2,
              ),
              icon: const Icon(Ionicons.checkmark, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    EditItem(
                      title: "Photo",
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "",
                            style: TextStyle(color: Colors.white),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                80), // Half of width and height
                            child: Image.asset(
                              "images/Avatar1.png",
                              width: 110,
                              height: 110,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc) {
                                  return SafeArea(
                                    child: Container(
                                      child: Wrap(
                                        children: <Widget>[
                                          ListTile(
                                            leading:
                                                const Icon(Icons.photo_library),
                                            title: const Text('Gallery'),
                                            onTap: () {
                                              // Implement functionality for photo library
                                            },
                                          ),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.photo_camera),
                                            title: const Text('Camera'),
                                            onTap: () {
                                              // Implement functionality for camera
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.lightBlueAccent,
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text("Upload Image"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    EditItem(
                      title: "Name",
                      widget: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15), // Add padding
                          labelText: '',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    EditItem(
                      title: "NIC",
                      widget: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _nicController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15), // Add padding
                          labelText: '',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid street address, city, state';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    EditItem(
                      title: "Gender",
                      widget: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: gender == "Male"
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.circular(60), // Make it round
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white, // Border color
                                  width: 2, // Border width
                                ),
                                borderRadius:
                                    BorderRadius.circular(60), // Make it round
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    gender = "Male";
                                  });
                                },
                                icon: Icon(
                                  Ionicons.male,
                                  color: gender == "Male"
                                      ? Colors.white
                                      : Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          Container(
                            decoration: BoxDecoration(
                              color: gender == "Female"
                                  ? const Color.fromARGB(255, 252, 89, 143)
                                  : Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.circular(60), // Make it round
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white, // Border color
                                  width: 2, // Border width
                                ),
                                borderRadius:
                                    BorderRadius.circular(60), // Make it round
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    gender = "Female";
                                  });
                                },
                                icon: Icon(
                                  Ionicons.female,
                                  color: gender == "Female"
                                      ? Colors.white
                                      : Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    EditItem(
                      title: "Age",
                      widget: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _ageController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15), // Add padding
                          labelText: '',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid integer';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 50),
                    EditItem(
                      title: "E-mail",
                      widget: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15), // Add padding
                          labelText: '',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Increase border radius
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1, // Increase border width
                            ),
                          ),
                        ),
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (!regex.hasMatch(value!)) {
                            return 'Enter Valid Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _nicController.dispose();
    super.dispose();
  }
}

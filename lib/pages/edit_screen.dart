import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shieldy/pages/account_screen.dart';
import 'package:shieldy/utils/colors.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, _nameController.text);
                  }
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: Size(50, 30),
                  elevation: 2,
                ),
                icon: const Icon(Ionicons.checkmark, color: Colors.white),
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
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      EditItem(
                        title: "Photo",
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Photo",
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                              "images/avatar.png",
                              width: 90,
                              height: 90,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.lightBlueAccent,
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text("Upload Image"),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      EditItem(
                        title: "Name",
                        widget: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
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
                        title: "Address",
                        widget: TextFormField(
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
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
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  gender = "Male";
                                });
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: gender == "Male"
                                    ? Colors.blue
                                    : Colors.grey.shade200,
                                fixedSize: const Size(80, 80),
                              ),
                              icon: Icon(
                                Ionicons.male,
                                color: gender == "Male"
                                    ? Colors.white
                                    : Colors.black,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 40),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  gender = "Female";
                                });
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: gender == "Female"
                                    ? Colors.pink
                                    : Colors.grey.shade200,
                                fixedSize: const Size(80, 80),
                              ),
                              icon: Icon(
                                Ionicons.female,
                                color: gender == "Female"
                                    ? Colors.white
                                    : Colors.black,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      EditItem(
                        title: "Age",
                        widget: TextFormField(
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
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
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern.toString());
                            if (!regex.hasMatch(value!))
                              return 'Enter Valid Email';
                            else
                              return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

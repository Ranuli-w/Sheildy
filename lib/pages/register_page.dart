import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/Components/my_textfield.dart';
import 'package:shieldy/Components/sign_in_button.dart';
import 'package:shieldy/Components/square_tile.dart';
import 'package:shieldy/services/auth_service.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    ageController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  
  Future signUserUp() async {

    //show loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    
    //try creating the user
    try {
      //create the user
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        } else {
          showErrorMessage('Passwords do not match !');
        }

      //add user details to firestore
      addUserDetails(
        nameController.text,
        int.parse(ageController.text),
        usernameController.text,
        emailController.text,
      );
      

      
      // Navigate to the next screen upon successful sign-in
    } on FirebaseAuthException catch (e) {
      //Show error message
      showErrorMessage(e.code);
    }

    //hide loading circle
    Navigator.pop(context);
  }

  Future addUserDetails(String nameController, int ageController, String usernameController, String emailController) async {
    await FirebaseFirestore.instance.collection("User_Details").add({
      'Name': nameController,
      'Age': ageController,
      'Username': usernameController,
      'Email': emailController,
    });

  }

  //Error message for the user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: ( context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                //Name Text Fields
                MyTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
                  textColor: Colors.black,
                  
                ),

                const SizedBox(height: 10),

                //Age Text Fields
                MyTextField(
                  controller: ageController,
                  hintText: 'Age',
                  obscureText: false,
                  textColor: Colors.black,
                  
                ),

                const SizedBox(height: 10),

                //Username Text Fields
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  textColor: Colors.black,
                ),

                const SizedBox(height: 10),

                //Email Text Fields
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  textColor: Colors.black,
                ),

                const SizedBox(height: 10),

                

              //password text field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  textColor: Colors.black,
                ),

                const SizedBox(height: 10),

              //confirm password text field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  textColor: Colors.black,
                ),


                const SizedBox(height: 10),

                //sign up button
                Sign_in_button(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Google Button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'images/google.png'),

                    SizedBox(width: 25),

                    SquareTile(
                      onTap:() => AuthService().signInWithFacebook(),
                      imagePath: 'images/facebook.png'),
                  ],
                ),


                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ', style: TextStyle(color: Colors.black)
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'LogIn now',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

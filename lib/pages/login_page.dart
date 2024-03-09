
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shieldy/Components/my_textfield.dart';
import 'package:shieldy/Components/sign_in_button.dart';
import 'package:shieldy/Components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  //text edtiting controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in function
 void signUserIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
        
        
          //logo
          const Icon(
            Icons.account_circle,
            size: 100,
            ),
          
          const SizedBox(height: 50),

          //welcome back
          Text('Welcome Back',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,),
            ),

          const SizedBox(height: 25),

          //username textfield
          MyTextField(
              controller: emailController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

          
            //password textfield
            MyTextField(
              controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          //forgot password?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password?',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,),
                  ),
              ],
            ),
          ),
        
          const SizedBox(height: 10),

          //Sign in button
          sign_in_button(
            onTap: signUserIn,
          ),
        
          const SizedBox(height: 30),

          //or continue with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(child: Divider(
                  color: Colors.grey[400],
                  thickness: 0.5,
                  ),
                  ),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('or continue with',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,)
                  ),
                ),  
            
                Expanded(child: Divider(
                  color: Colors.grey[400],
                  thickness: 0.5,
                  ),
                  ),
              ],
            ),
          ),
        
          const SizedBox(height: 20),

          //google and facebook buttons
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //google button
            SquareTile(imagePath: 'images/google.png',),

            SizedBox(width: 25),

            //facebook button
            SquareTile(imagePath: 'images/facebook.png'),
            
           ],),
        
          const SizedBox(height: 20),

          //not a member? register now

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member? ',
              style: TextStyle(
                color: Colors.black,
                )),
              Text('Register Now', 
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold),
                ), 
            ],
          )
        
        ],
        ),
      ),
    )
    );
  }
}

      
// import 'package:flutter/material.dart';
// import 'package:shieldy/Components/my_textfield.dart';
// import 'package:shieldy/Components/sign_in_button.dart';

// class EditProfilePage extends StatelessWidget {
//   EditProfilePage({Key? key}) : super(key: key);

//   // Text editing controllers
//   final fullNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final newPasswordController = TextEditingController();

//   // Update profile function
//   updateProfile() {
//     // Implement the logic to update the user's profile here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Full Name text field
//               MyTextField(
//                 controller: fullNameController,
//                 hintText: 'Full Name',
//                 obscureText: false,
//               ),

//               const SizedBox(height: 10),

//               // Email text field
//               MyTextField(
//                 controller: emailController,
//                 hintText: 'Email',
//                 obscureText: false,
//               ),

//               const SizedBox(height: 10),

//               // New Password text field
//               MyTextField(
//                 controller: newPasswordController,
//                 hintText: 'New Password',
//                 obscureText: true,
//               ),

//               const SizedBox(height: 20),

//               // Update Profile button
//               sign_in_button(
//                 onTap: updateProfile,
//                 buttonText: 'Update Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

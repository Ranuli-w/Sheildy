// import 'dart:typed_data';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shieldy/providers/user_provider.dart';
// import 'package:shieldy/resources/firestore_methods.dart';
// import 'package:shieldy/utils/add_post_util.dart';
// import 'package:shieldy/utils/colors.dart';
// import 'package:provider/provider.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key}) : super(key: key);

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   Uint8List? _file;
//   final TextEditingController _descriptionController = TextEditingController();

//   void postImage(
//     String uid,
//     String username,
//     String profImage,
//   ) async {
//     try {

//       String res = await FirestoreMethods().uploadPost(
//         _descriptionController.text,
//         _file!,
//         uid,
//         username,
//         profImage,
//       );

//       if (res == "success") {
//         showSnackBar(context, 'posted!');
//       } else {
//         showSnackBar(context, res);
//       }
//     } catch (err) {
//       showSnackBar(context, toString());
//     }
//   }

//   _selectImage(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           title: const Text('Create a Post'),
//           children: [
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text('Take A Photo'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 Uint8List file = await pickImage(ImageSource.camera);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text('Choose From Gallery'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 Uint8List file = await pickImage(ImageSource.gallery);
//                 setState(() {
//                   _file = file;
//                 });
//               },
//             ),
//             SimpleDialogOption(
//               padding: const EdgeInsets.all(20),
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _descriptionController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final UserProvider userProvider = Provider.of<UserProvider>(context);

//     if (_file == null) {
//       return Center(
//         child: IconButton(
//           icon: const Icon(Icons.upload),
//           onPressed: () => _selectImage(context),
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: mobileBackgroundColor,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => _selectImage(context),
//           ),
//           title: const Text('Publish Post'),
//           centerTitle: false,
//           actions: [
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 'Publish',
//                 style: TextStyle(
//                   color: Colors.blueAccent,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     UserProvider().getUser.photoUrl,
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: TextField(
//                     controller: _descriptionController,
//                     decoration: const InputDecoration(
//                       hintText: 'Write a description about the situation',
//                       border: InputBorder.none,
//                     ),
//                     maxLines: 8,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   width: 45,
//                   child: AspectRatio(
//                     aspectRatio: 487 / 451,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: MemoryImage(_file!),
//                           fit: BoxFit.fill,
//                           alignment: FractionalOffset.topCenter,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Divider(),
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

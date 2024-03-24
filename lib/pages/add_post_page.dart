import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shieldy/resources/firestore_methods.dart';
import 'package:shieldy/resources/storage_methods.dart';
import 'package:shieldy/utils/add_post_util.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

 CameraController? _cameraController;
  File? _selectedImage;
  void initState() {
    super.initState();
    _initializeCamera();
  }

  



  Uint8List? _file; // Stores the selected image file
  final TextEditingController _descriptionController = TextEditingController();
  String? _userLocation; // Stores the user's location
  String? username = FirebaseAuth.instance.currentUser?.displayName; // Stores the current user's display name

  // Get the user's current location
  Future<void> getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _userLocation = "${position.latitude}, ${position.longitude}";
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // Select an image from the camera or gallery
  _selectImage(BuildContext context, ImageSource source) async {
    Navigator.of(context).pop(); // Close the dialog
    Uint8List file = await pickImage(source);
    setState(() {
      _file = file;
    });
  }
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    await _cameraController!.initialize();
    setState(() {});
  }

  

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_file == null) {
      // Show a button to select an image
      return Center(
        child: IconButton(
          icon: const Icon(Icons.upload),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: const Text('Create a Post'),
              children: [
                SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Take A Photo'),
                  onPressed: () => _selectImage(context, ImageSource.camera),
                ),
                SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Choose From Gallery'),
                  onPressed: () => _selectImage(context, ImageSource.gallery),
                ),
                SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Show the post creation UI with the selected image
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => setState(() => _file = null), // Reset the selected image
          ),
          title: const Text('Publish Post'),
          centerTitle: false,
          actions: [
            TextButton(
              child: const Text(
                'Publish',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (_file != null && user != null) {
                  // Check if the user's location is available
                  if (_userLocation == null) {
                    await getUserLocation();
                  }
                  if (_userLocation != null) {
                    // Upload the image to Firebase Storage
                    String fileName = DateTime.now().toString() + '.jpg';
                    String username = user.displayName ?? '';
                    String folderPath = 'uploaded_posts/$username/photos';
                    String downloadUrl = await StorageMethods()
                        .uploadImageToStorage(folderPath, _file!, true);

                    // Upload the post to Firestore
                    await FirestoreMethods().uploadPost(
                      _descriptionController.text,
                      _file!,
                      user.uid,
                      downloadUrl,
                    );

                    setState(() {
                      _file = null;
                      _descriptionController.clear();
                    });

                    showSnackBar(context, 'Photo uploaded successfully');
                  } else {
                    showSnackBar(context, 'Failed to fetch user location');
                  }
                } else {
                  showSnackBar(context,
                      'Please select a photo and ensure you are logged in');
                }
              },
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Write a description about the situation',
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(_file!),
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      );
    }
  }
}
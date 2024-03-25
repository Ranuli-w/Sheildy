import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shieldy/resources/firestore_methods.dart';
import 'package:shieldy/resources/storage_methods.dart';
import 'package:shieldy/utils/add_post_util.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  String? _userLocation;
  String? username = FirebaseAuth.instance.currentUser?.displayName;

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

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
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
            onPressed: _file != null
                ? () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      if (_userLocation == null) {
                        await getUserLocation();
                      }
                      if (_userLocation != null) {
                        String fileName = DateTime.now().toString() + '.jpg';
                        String username = user.displayName ?? '';
                        String folderPath = 'uploaded_posts/$username/photos';
                        String downloadUrl =
                            await StorageMethods().uploadImageToStorage(
                                folderPath, _file!, true);

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
                      showSnackBar(
                          context,
                          'Please ensure you are logged in');
                    }
                  }
                : null,
          )
        ],
      ),
      body: _file == null
          ? CameraView(onImageCaptured: (file) {
              setState(() {
                _file = file;
              });
            })
          : Column(
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
                        child: GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text('Create a Post'),
                              children: [
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: const Text('Retake A Photo'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      _file = null;
                                    });
                                  },
                                ),
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: const Text('Use This Photo'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: const Text('Cancel'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          ),
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
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
    );
  }

  void initState() {
    super.initState();
    _checkLocationAndSendNotification();
  }

  Future<void> _checkLocationAndSendNotification() async {
    while (true) {
      await FirestoreMethods().checkLocationAndSendNotification();
      await Future.delayed(const Duration(minutes: 5)); // Check every 5 minutes
    }
  }
}

class CameraView extends StatefulWidget {
  final Function(Uint8List) onImageCaptured;

  const CameraView({Key? key, required this.onImageCaptured})
      : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<void> _captureImage() async {
    try {
      final image = await _controller.takePicture();
      final bytes = await image.readAsBytes();
      widget.onImageCaptured(bytes);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget buildPreview() {
    return GestureDetector(
      onTap: _captureImage,
      child: CameraPreview(_controller),
    );
  }
}
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shieldy/utils/add_post_util.dart';
import 'package:shieldy/utils/colors.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    await _cameraController!.initialize();
    setState(() {});
  }

  void _toggleCameraSelection() {
    setState(() {
      _isRearCameraSelected = !_isRearCameraSelected;
    });
    _initializeCamera();
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Do something with the selected image
    }
  }

  void _showAddPostDialog(BuildContext context) {
    showDialog(
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
    );
  }

  void _selectImage(BuildContext context, ImageSource source) async {
    Navigator.of(context).pop();
    Uint8List file = await pickImage(source);
    // Do something with the selected image file
    // You can navigate to the AddPostScreen and pass the file
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            mobileBackgroundColor, // Ensure this color is defined or use a Color value directly
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.switch_camera),
            onPressed: _toggleCameraSelection,
          ),
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: _pickImageFromGallery,
          ),
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => _showAddPostDialog(context),
          ),
        ],
      ),
      body: CameraPreview(_cameraController!),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}
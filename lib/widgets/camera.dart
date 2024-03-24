import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shieldy/utils/add_post_util.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  bool _isRearCameraSelected = true;

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
        title: Text('Camera'),
        actions: [],
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

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shieldy/pages/add_post_page.dart';
import 'package:shieldy/utils/add_post_util.dart';
class camerapage extends StatefulWidget {
  const camerapage({Key? key}) : super(key: key);

  @override
  State<camerapage> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<camerapage> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openCamera();
    });
  }

  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final Uint8List file = await photo.readAsBytes();
      setState(() {
        _file = file;
      });
      _showDialogBox();
    }
  }

  void _showDialogBox() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('select A Photo'),
            onPressed: () => _selectImage(context, ImageSource.gallery),
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Use This Photo'),
            onPressed: () => _selectImage(context, ImageSource.camera),
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

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The UI part where you can customize your screen after capturing the image
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Center(
        child: _file != null
            ? GestureDetector(
                onTap: _showDialogBox,
                child: Image.memory(_file!),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }



   _selectImage(BuildContext context, ImageSource source) async {
    Navigator.of(context).pop();
    Uint8List file = await pickImage(source);
    setState(() {
      _file = file;
    });
  }
}

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Add this line
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String childName, Uint8List file, String userId) async {
    try {
      // Create a reference to the user's folder using their UID
      Reference ref = _storage.ref().child(childName).child(userId);

      // Generate a unique ID for the image
      String id = const Uuid().v1();
      ref = ref.child(id);

      // Upload the image data to Firebase Storage
      UploadTask uploadTask = ref.putData(file);

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL of the uploaded image
      String downloadUrl = await ref.getDownloadURL();
      
      // Return the download URL
      return downloadUrl;
    } catch (error) {
      // Handle any errors that occur during the upload process
      print('Error uploading image: $error');
      return ''; // Return an empty string if an error occurs
    }
  }
}

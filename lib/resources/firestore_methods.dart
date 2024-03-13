import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shieldy/model/post.dart';
import 'package:shieldy/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid, String username, String profImage) async {
    try {
      // Upload the image to Firebase Storage and get the download URL
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, uid);

      // Generate a unique ID for the post
      String postId = const Uuid().v1();
      
      // Create a Post object
      Post post = Post(
        description: description,
        uid: uid,
        usernameController: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      // Save the post data to Firestore
      await _firestore.collection('posts').doc(postId).set(post.toJson());

      return "success"; // Return success if the post is uploaded successfully
    } catch (error) {
      // Handle any errors that occur during the upload process
      print('Error uploading post: $error');
      return 'An error occurred while uploading the post';
    }
  }
}

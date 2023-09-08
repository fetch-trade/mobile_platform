import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:teens_next/app/feeds/model/post.dart';

class PostingService extends ChangeNotifier {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final timestamp = Timestamp.now();

  Future<void> sendPost(String title, String message) async {
    final String currentUserName = _firebaseAuth.currentUser!.displayName.toString();

    Post newPost =
        Post(title: title, senderName: currentUserName, message: message, timestamp: timestamp);

    await FirebaseFirestore.instance
        .collection('user_posts')
        .add(newPost.toMap());
  }

  Stream<QuerySnapshot> getPosts() {
    return _firebaseFirestore
        .collection('user_posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}

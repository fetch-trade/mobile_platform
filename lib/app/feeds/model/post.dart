import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String title;
  final String senderName;
  final String message;
  final String senderUid;
  final Timestamp timestamp;

  Post(
      {required this.title,
      required this.senderName,
      required this.message,
      required this.senderUid,
      required this.timestamp});

  // convert values to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'name': senderName,
      'message': message,
      'senderUid': senderUid,
      'timestamp': timestamp,
    };
  }
}
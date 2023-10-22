import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String title;
  final String senderName;
  final String comment;
  final String senderUid;
  final Timestamp timestamp;

  Comment(
      {required this.title,
      required this.senderName,
      required this.comment,
      required this.senderUid,
      required this.timestamp});

  // convert values to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'name': senderName,
      'comment': comment,
      'senderUid': senderUid,
      'timestamp': timestamp,
    };
  }
}
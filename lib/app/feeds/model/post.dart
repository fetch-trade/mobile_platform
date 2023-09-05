import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String senderName;
  final String message;
  final Timestamp timestamp;
  
  Post({
    required this.senderName, 
    required this.message, 
    required this.timestamp
  });

  // convert values to a map
  Map<String, dynamic> toMap() {
    return {
      'name': senderName,
      'message': message,
      'timestamp': timestamp
    };
  }
}
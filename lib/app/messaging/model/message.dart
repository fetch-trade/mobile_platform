import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  final String senderName;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.senderName,
      required this.receiverId,
      required this.message,
      required this.timestamp});

  // convert values to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'senderName': senderName,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp
    };
  }
}

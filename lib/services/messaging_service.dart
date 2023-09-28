import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:teens_next/app/messaging/model/message.dart';

class MessagingService extends ChangeNotifier {
  // get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // POST message
  Future<void> sendMessage(String receiverId, String message) async {
    // get user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentUserName =
        _firebaseAuth.currentUser!.displayName.toString();
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        senderName: currentUserName,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    // construct chat room id from from current user and receiver id (sorted)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // add new message to firestore
    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET message
  Stream<QuerySnapshot> getMessages(String userId, String altUserId) {
    // construct chat room id from user ids (sorted)
    List<String> ids = [userId, altUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // GET most recent message
  Future<Map<String, dynamic>> getLastMessageSent(String userId, String altUserId) async {
    try {
      Stream<QuerySnapshot> messagesStream = getMessages(userId, altUserId);

      var snapshot = await messagesStream.first;

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot lastMessageDocument = snapshot.docs.first;
        return lastMessageDocument.data() as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/components/message_bubble.dart';
import 'package:teens_next/components/message_input_field.dart';
import 'package:teens_next/services/messaging_service.dart';

class MessagesScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUid;

  const MessagesScreen({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUid,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _messageController = TextEditingController();
  final MessagingService _messagingService = MessagingService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    // send if and only if message controller has data
    if (_messageController.text.isNotEmpty) {
      await _messagingService.sendMessage(
          widget.receiverUid, _messageController.text);

      // clear the controller after sending message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.receiverUserEmail),
      ),
      child: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Material(
      child: Row(
        children: [
          Expanded(
              child: MessageInputField(
            controller: _messageController,
            hintText: 'Enter Message',
            obscureText: false,
          )),
          IconButton(
            color: const Color.fromARGB(255, 100, 105, 255),
            padding: const EdgeInsets.only(left: 20.0, right: 24.0),
            alignment: Alignment.centerRight,
            onPressed: sendMessage,
            icon: const Icon(
              CupertinoIcons.chevron_up_circle_fill,
              size: 36,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final bool isCurrentUser =
        data['senderId'] == FirebaseAuth.instance.currentUser!.uid;

    var alignment = (data['receiverId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              MessageBubble(text: data['message'], isCurrentUser: isCurrentUser),
            ]),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _messagingService.getMessages(
          widget.receiverUid, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Error${snapshot.error}",
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24,
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }
}

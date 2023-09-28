import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/messaging/screens/messages_screen.dart';
import 'package:teens_next/services/messaging_service.dart';

class NotificationsScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUid;

  const NotificationsScreen(
      {super.key, required this.receiverUserEmail, required this.receiverUid});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  final MessagingService _messagingService = MessagingService();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(
          "Notifications",
          style: TextStyle(fontFamily: 'Capriola', fontSize: 24),
        ),
      ),
      child: _buildUserList(),
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    return FutureBuilder(
      future: _messagingService.getLastMessageSent(data['receiverId'], data['senderId']),
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
              fontSize: 16,
            ),
          );
        }

        final lastMessageData = snapshot.data!;
        final lastMessageText = lastMessageData['message'];

        return Material(
            child: ListTile(
          title: Text(data['name']),
          subtitle: Text(lastMessageText),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => MessagesScreen(
                              receiverUserName: data['name'],
                              receiverUid: data['receiverId'],
                            )));
              },
              icon: const Icon(Iconsax.rotate_left)),
        ));
      },
    );

    /*
    if (_firebaseAuth.currentUser!.email != data['email']) {
      return Material(
        child: ListTile(
          title: Text(data['name']),
          subtitle: Text(_messagingService
              .getLastMessageSent(
                data['uid'], currentUserUid)
              .toString()),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => MessagesScreen(
                              receiverUserName: data['name'],
                              receiverUid: data['uid'],
                            )));
              },
              icon: const Icon(Iconsax.rotate_left)),
        ),
      );
    } else {
      return Container();
    }
    */
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Error",
            style: TextStyle(fontFamily: 'Capriola', fontSize: 24),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading",
            style: TextStyle(fontFamily: 'Capriola', fontSize: 24),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }
}

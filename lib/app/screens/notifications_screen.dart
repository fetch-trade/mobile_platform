import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:teens_next/app/messaging/messages_screen.dart';

class NotificationsScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUid;

  const NotificationsScreen(
      {super.key, required this.receiverUserEmail, required this.receiverUid});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

    var chatDocuments = [];

    FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc('documentId')
        .collection('messages')
        .where(_auth.currentUser!.uid, isEqualTo: true)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      chatDocuments = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        Map<String, dynamic> names = data['name'];
        names.remove(_auth.currentUser);

        return {'documentId': document.id, 'name': names.values.first};
      }).toList();
    });

    if (_auth.currentUser!.email != data['email']) {
      return Material(
        child: ListTile(
          title: Text(data['name']),
          subtitle: Text(FirebaseFirestore.instance
              .collection('chat_rooms')
              .doc('documentId')
              .collection('messages')
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get()
              .then((QuerySnapshot snapshot) {
            for (var document in chatDocuments) {
              /*
                * document value not used
                * value returned is Future reference
                * treat as error
                */

              FirebaseFirestore.instance
                  .collection('chat_rooms')
                  .doc('documentId')
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .limit(1)
                  .snapshots()
                  .listen((QuerySnapshot snapshot) {});
            }
          }).toString()),
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

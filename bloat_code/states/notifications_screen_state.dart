import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'notifications_screen_state.g.dart';

class NotificationsScreenState = _NotificationsScreenState
    with _$NotificationsScreenState;

abstract class _NotificationsScreenState with Store {
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference chatRooms =
      FirebaseFirestore.instance.collection('chat_rooms');

  @observable
  Map<String, dynamic> messages = ObservableMap();

  @action
  void refreshChatRoomsForCurrentUser() {
    var chatDocuments = [];

    chatRooms
        .where('user.$currentUser', isNull: true)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      chatDocuments = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        Map<String, dynamic> names = data['name'];
        names.remove(currentUser);

        return {'documentId': document.id, 'name': names.values.first};
      }).toList();
    });

    for (var document in chatDocuments) {
      FirebaseFirestore.instance
          .collection('chats/${document['documentId']}/messages')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .snapshots()
          .listen((QuerySnapshot snapshot) {
        messages[document['name']] = {
          if (snapshot.docs.isNotEmpty)
            {
              'message': snapshot.docs.first['message'],
              'timestamp': snapshot.docs.first['timestamp'],
              'senderName': document['name'],
              'senderId': snapshot.docs.first['senderId']
            }
        };
      });
    }
  }
}

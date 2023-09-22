import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetGradientColors {
  List<Color> colorList = List.empty(growable: true);

  getColors() async {
    final firebaseFirestore = FirebaseFirestore.instance;
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;

    DocumentSnapshot snapshot =
        await firebaseFirestore.collection('users').doc(currentUserUid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    colorList = [
      Color(data['user_color_one']! as int),
      Color(data['user_color_two']! as int)
    ];

    return colorList;
  }
}
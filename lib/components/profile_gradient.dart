import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileGradient extends StatelessWidget {
  final double width;
  final double height;

  const ProfileGradient(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final firebaseFirestore = FirebaseFirestore.instance;
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    return FutureBuilder(
        future: firebaseFirestore.collection('users').doc(currentUserId!).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
          if (userSnapshot.hasError) {
            return Text(
              "Error${userSnapshot.error}",
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 24,
              ),
            );
          }

          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 218, 44, 90),
                    size: width));
          }

          Map<String, dynamic> userData =
            userSnapshot.data!.data() as Map<String, dynamic>;
          Color userColorOne = Color(userData['user_color_one']);
          Color userColorTwo = Color(userData['user_color_two']);

          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [userColorOne, userColorTwo],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          );
        });
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fetch/app/authentication/model/app_user.dart';

class AuthService extends ChangeNotifier {
  // auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // firestore instance
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final int userColorOne =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1)
          .value;
  final int userColorTwo =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1)
          .value;

  // sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // merge document if neccesary
      _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user?.uid,
        'name': userCredential.user?.displayName,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create a new user
  Future<UserCredential> signUpWithEmailAndPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        AppUser user = AppUser(
          uid: userCredential.user!.uid,
          name: userCredential.user!.displayName,
          email: email,
          userColorOne: userColorOne,
          userColorTwo: userColorTwo,
        );

        // Create a new document for the user in the 'users' collection
        await _firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toMap());
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
}


  // sign user out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
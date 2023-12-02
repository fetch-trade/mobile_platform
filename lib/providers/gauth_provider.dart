import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fetch/firebase_options.dart';

class GAuthProvider {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();

    // firestore instance
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // instantiates a new googleAuth user
    final gUser = await FirebaseAuth.instance.signInWithCredential(credential);

    final Color userColorOne =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
    final Color userColorTwo =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);

    // add googleAuth user to the firestore
    firebaseFirestore.collection('users').doc(gUser.user?.uid).set({
      'email': gUser.user?.email,
      'name': gUser.user?.displayName,
      'uid': gUser.user?.uid,
      'user_color_one': userColorOne,
      'user_color_two': userColorTwo 
    }, SetOptions(merge: true));

    // Once signed in, return the UserCredential
    return gUser;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GAuthProvider {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

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

    // add googleAuth user to the firestore
    firebaseFirestore.collection('users').doc(gUser.user?.uid).set({
      'name': gUser.user?.displayName,
      'uid': gUser.user?.uid,
    }, SetOptions(merge: true));

    // Once signed in, return the UserCredential
    return gUser;
  }
}

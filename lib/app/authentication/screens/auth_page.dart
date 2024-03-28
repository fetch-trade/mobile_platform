import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fetch/app/authentication/components/toggle_page.dart';
import 'package:fetch/app/screens/home_screen.dart';

class AuthPage extends StatelessWidget {
  final String action;

  const AuthPage({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user is signed in 
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        //user is not signed in
        else {
          return TogglePage(action: action);
        }
      },
    ));
  }
}

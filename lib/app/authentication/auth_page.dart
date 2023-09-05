import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/authentication/toggle_page.dart';
import 'package:teens_next/app/screens/home_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
            return const TogglePage();
          }
        },
      )
    );
  }
}
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/authentication/components/enter_button.dart';
import 'package:teens_next/app/authentication/screens/screens.dart';
import 'package:teens_next/app/authentication/screens/user_name.dart';
import 'package:teens_next/services/auth_service.dart';

class AuthOptions extends StatefulWidget {
  const AuthOptions({super.key});

  @override
  State<AuthOptions> createState() => _AuthOptionsState();
}

class _AuthOptionsState extends State<AuthOptions> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String authAction = "";

  // sign user in method
  void signUserIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          e.toString(),
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Capriola',
            fontSize: 12,
          ),
        )),
      );
    }
  }

  // sign user up method
  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Passwords do not match!",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Capriola',
          fontSize: 12,
        ),
      )));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);

      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const UserName()),
          (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
        style: const TextStyle(
          fontFamily: 'Capriola',
          fontSize: 12,
        ),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 120, left: 20),
                  child: Text(
                    "Welcome to fetch",
                    style: TextStyle(
                      color: Color(0xFFE33F5E),
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 24, left: 20),
                  child: Text(
                    "The ultimate exchange platform",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: EnterButton(
                    onTap: () {
                      // Sign In button pressed
                      authAction = "signIn";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPage(action: authAction),
                        ),
                      );
                    },
                    color: Colors.black, // Color for 'Sign In' button
                    text: "Sign In",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: EnterButton(
                    text: "Sign Up",
                    color: const Color(0xFFE33F5E),
                    onTap: () {
                      // Sign Up button pressed
                      authAction = "signUp";
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPage(action: authAction),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

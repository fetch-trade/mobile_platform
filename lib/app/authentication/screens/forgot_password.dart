import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/authentication/screens/auth_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context, const AuthPage());
          },
        ),
      ),
      body: const Align(
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Capriola',
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Color.fromARGB(255, 100, 105, 255),
          ),
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

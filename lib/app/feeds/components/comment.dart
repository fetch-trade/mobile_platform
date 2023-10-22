import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;

  const Comment(
      {super.key, required this.text, required this.user, required this.time});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sign out",
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Capriola',
            color: Colors.black,
            fontSize: 16),
      ),
    );
  }
}
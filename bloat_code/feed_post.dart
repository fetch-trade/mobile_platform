import 'package:flutter/material.dart';

class FeedPost extends StatelessWidget {
  final String message;
  final String user;

  const FeedPost(
      {super.key,
      required this.message,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'Capriola',
                fontSize: 12
              ),
            ),
            Text(
              user,
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'Capriola',
                fontSize: 12
              ),
            )
          ],
        ),
      ],
    );
  }
}

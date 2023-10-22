import 'package:flutter/material.dart';

class ProfileGradient extends StatelessWidget {
  final List<Color> userColors;

  const ProfileGradient({super.key, required this.userColors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: userColors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
      ),
    );
  }
}
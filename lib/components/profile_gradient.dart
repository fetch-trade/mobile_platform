import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileGradient extends StatelessWidget {
  const ProfileGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color colorOne =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    Color colorTwo =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle, 
            gradient: LinearGradient(colors: [colorOne, colorTwo],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )),
      ),
    );
  }
}
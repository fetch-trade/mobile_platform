import 'package:flutter/material.dart';

class AltUserGradient extends StatelessWidget {
  final List<Color> userColors;

  const AltUserGradient({
    super.key,
    required this.userColors
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: userColors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
    );
  }
}

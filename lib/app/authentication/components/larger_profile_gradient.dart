import 'package:flutter/material.dart';
import 'package:teens_next/app/authentication/resources/get_gradient_colors.dart';

class LargerProfileGradient extends StatelessWidget {
  const LargerProfileGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final gradientColors = GetGradientColors();

    return FutureBuilder(
        future: gradientColors.getCurrentUserColors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "Error${snapshot.error}",
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 24,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
              "Loading",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 16,
              ),
            );
          }

          return Row(
            children: [
              const SizedBox(width: 16),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: snapshot.data as List<Color>,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),]
          );
        });
  }
}

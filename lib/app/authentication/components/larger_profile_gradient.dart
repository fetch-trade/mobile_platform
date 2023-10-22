import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teens_next/app/authentication/resources/get_gradient_colors.dart';

class LargerProfileGradient extends StatelessWidget {
  final double width;
  final double height;

  const LargerProfileGradient(
      {super.key, required this.width, required this.height});

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
            return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 100, 105, 255), size: width));
          }

          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: snapshot.data as List<Color>,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          );
        });
  }
}

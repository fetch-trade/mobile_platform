import 'package:flutter/material.dart';

class SplashScreenScaffold extends StatelessWidget {
  const SplashScreenScaffold({super.key, required this.body});
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: body,
      ),
    );
  }
}

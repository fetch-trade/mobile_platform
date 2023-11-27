import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;

  const EnterButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

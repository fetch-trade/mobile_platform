import 'package:flutter/material.dart';

class UsernameInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextAlign textAlign;
  final double maxLength;
  final TextStyle style;
  final TextInputType keyboardType;

  const UsernameInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textAlign,
      required this.maxLength,
      required this.style,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ),
    );
  }
}

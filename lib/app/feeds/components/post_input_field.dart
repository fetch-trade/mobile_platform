import 'package:flutter/material.dart';

class PostInputField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final TextStyle hintTextStyle;

  const PostInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText, 
    required this.hintTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: SizedBox(
        width: 600,
        height: 300,
        child: TextField(
          autocorrect: true,
          maxLength: 300,
          maxLines: 50,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: hintTextStyle),
          style: const TextStyle(
              color: Colors.black, 
              fontFamily: 'Capriola', 
              fontSize: 18
          ),
        ),
      ),
    );
  }
}

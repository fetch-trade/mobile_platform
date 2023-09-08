import 'package:flutter/material.dart';

class PostTitleInputField extends StatelessWidget {
  final controller;
  final String hintText;

  const PostTitleInputField(
      {super.key,
      required this.controller,
      required this.hintText,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: SizedBox(
        child: TextField(
          controller: controller,
          maxLength: 35,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black, fontFamily: 'REM', fontSize: 18
          ),
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
              hintStyle: TextStyle(
                  color: Colors.grey[500], fontFamily: 'REM', fontSize: 18)),
        ),
      ),
    );
  }
}

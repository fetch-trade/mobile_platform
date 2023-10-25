import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final int maxLength;
  final double width;
  final double height;
  final bool autocorrect;
  final bool obscureText;
  final TextAlign align;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final InputDecoration inputDecoration;

  const InputField(
      {super.key,
      required this.controller,
      required this.width,
      required this.height,
      required this.maxLines,
      required this.maxLength,
      required this.autocorrect,
      required this.obscureText,
      required this.align,
      required this.padding,
      required this.textStyle,
      required this.inputDecoration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          autocorrect: true,
          textAlign: align,
          maxLength: maxLength,
          style: textStyle,
          maxLines: maxLines,
          controller: controller,
          obscureText: obscureText,
          decoration: inputDecoration,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

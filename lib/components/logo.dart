import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.width, required this.height, required this.radius})
      : super(key: key);
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        shape: BoxShape.rectangle,
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Image(
          image: AssetImage('assets/imgs/tn_logo.svg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

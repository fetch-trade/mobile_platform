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
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        shape: BoxShape.rectangle,
        color: Colors.white.withOpacity(0.7),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const Logo(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          'assets/imgs/fetch_logo.svg',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
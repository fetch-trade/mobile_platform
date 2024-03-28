import 'package:flutter/material.dart';

class CircleTile extends StatelessWidget {
  final Function()? onTap;
  final Icon? icon;

  const CircleTile({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
          child: icon,
        ),
      ),
    );
  }
}

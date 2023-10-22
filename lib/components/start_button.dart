import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 96,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[200],
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.right_chevron,
                  color: CupertinoColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
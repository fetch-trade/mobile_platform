import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewComment extends StatelessWidget {
  const NewComment({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Text(
              "New Comment",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'REM', fontSize: 24),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                CupertinoButton.filled(
                  onPressed:() => Navigator.pop(context),
                  child: const Text(
                    "Go back",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontFamily: 'REM',
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
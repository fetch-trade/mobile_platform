import 'package:flutter/cupertino.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Align(
        child: Text(
          "User Feeds",
          style: TextStyle(
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

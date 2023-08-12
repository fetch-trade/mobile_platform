import 'package:flutter/cupertino.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Align(
        child: Text(
          "User Friends",
          style: TextStyle(
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
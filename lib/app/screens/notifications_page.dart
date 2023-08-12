import 'package:flutter/cupertino.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Align(
        child: Text(
          "User Notifications",
          style: TextStyle(
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
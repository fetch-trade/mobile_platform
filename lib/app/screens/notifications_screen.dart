import 'package:flutter/cupertino.dart';

class NotificationsScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUid;

  const NotificationsScreen({
    super.key, 
    required this.receiverUserEmail, 
    required this.receiverUid
    });

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.receiverUserEmail),
      ), 
      child: const Align(
        child: Text("User Notifications",
          style: TextStyle(
            fontFamily: 'Capriola',
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

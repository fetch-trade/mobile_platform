import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Color.fromARGB(255, 100, 105, 255),
          ),
        ),
        title: const Text(
          "Settings",
          style:
              TextStyle(color: Colors.black, fontFamily: 'REM', fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: () => Navigator.pop(context),
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
      ),
    );
  }
}

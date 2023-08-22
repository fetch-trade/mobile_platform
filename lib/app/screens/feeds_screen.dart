import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/services/auth_service.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
            "User Feeds",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 24),
          CupertinoButton.filled(
            onPressed: signOut,
            child: const Text(
              "Sign out",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: 'Capriola',
                fontSize: 24,
              ),
            ),
          )
        ],
      )
      ),
    );
  }
}

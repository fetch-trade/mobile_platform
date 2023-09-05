import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/services/auth_service.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Text("Friends",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 24
              ),
            ),    
          ),
          SliverFillRemaining(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "User Friends",
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
        ),
          )
        ],      
      ),
    );
  }
}

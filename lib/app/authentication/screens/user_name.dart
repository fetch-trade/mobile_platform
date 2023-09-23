import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/authentication/components/components.dart';
import 'package:teens_next/app/screens/home_screen.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Enter username",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 24
            ),
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: UsernameInputField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: 'Capriola',
                  fontSize: 24,
                ),
                maxLength: 12,
                controller: _nameController,
                keyboardType: TextInputType.name,
                hintText: "Enter a username",
              ),
            ),
          ),
          EnterButton(
              text: "Continue",
              onTap: () {
                FirebaseAuth.instance.currentUser!
                    .updateDisplayName(_nameController.text);
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const HomeScreen()));
              })
        ],
      ),
    );
  }
}

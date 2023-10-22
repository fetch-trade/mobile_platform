import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teens_next/app/authentication/components/components.dart';
import 'package:teens_next/app/authentication/screens/phone_number.dart';
import 'package:teens_next/components/input_field.dart';

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
          const Text(
            "Choose a username",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Capriola',
                fontSize: 24),
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: InputField(
                controller: _nameController,
                width: 440,
                height: 80,
                maxLines: 1,
                maxLength: TextField.noMaxLength,
                autocorrect: false,
                obscureText: false,
                align: TextAlign.center,
                padding: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: 'Capriola',
                  fontSize: 24,
                ),
                inputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "Enter username",
                  hintStyle: TextStyle(
                      color: Colors.grey[400], fontFamily: 'REM', fontSize: 18),
                ),
              ),
            ),
          ),
          EnterButton(
              text: "Continue",
              onTap: () {
                // String userDisplayName = _nameController.text;

                // look into this please
                FirebaseAuth.instance.currentUser!
                    .updateDisplayName(_nameController.text);

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const PhoneNumber()));
              })
        ],
      ),
    );
  }
}

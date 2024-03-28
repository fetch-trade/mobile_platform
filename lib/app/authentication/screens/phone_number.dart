import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fetch/app/authentication/components/enter_button.dart';
import 'package:fetch/app/screens/home_screen.dart';
import 'package:fetch/components/input_field.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter your phone number",
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
                controller: _numberController,
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
                  hintText: "Phone number",
                  hintStyle: TextStyle(
                      color: Colors.grey[400], fontFamily: 'REM', fontSize: 18),
                ),
              ),
            ),
          ),
          EnterButton(
              text: "Continue",
              color: Colors.black,
              onTap: () {
                // String userDisplayName = _nameController.text;

                // look into this please
                // FirebaseAuth.instance.currentUser!
                //    .updatePhoneNumber(_numberController.text);

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const HomeScreen()));
              })
        ],
      ),
    );
  }
}

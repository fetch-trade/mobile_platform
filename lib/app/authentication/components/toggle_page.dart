import 'package:flutter/material.dart';
import 'package:fetch/app/authentication/screens/sign_in.dart';
import 'package:fetch/app/authentication/screens/sign_up.dart';

class TogglePage extends StatefulWidget {
  final String action;

  const TogglePage({super.key, required this.action});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  // show login page at start
  bool showLoginPage = true;

  @override
  void initState() {
    super.initState();

    if (widget.action == 'signUp') {
      showLoginPage = false;
    }
  }

  //toggle between login and register pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignIn(
        onTap: togglePages,
      );
    } else {
      return SignUp(
        onTap: togglePages,
      );
    }
  }
}

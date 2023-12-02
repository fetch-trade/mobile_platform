import 'package:flutter/cupertino.dart';
import 'package:fetch/app/authentication/components/splash_screen_scaffold.dart';
import 'package:fetch/app/authentication/screens/auth_options.dart';
// import 'package:fetch/app/authentication/screens/auth_page.dart';
import 'package:fetch/components/components.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay for 2 seconds before navigating to the authentication page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const AuthOptions()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SplashScreenScaffold(
        body: [
          Center(
            child: Logo(
              width: 300,
              height: 300,
              radius: 50,
            ),
          ),
          /*
          const Text(
            "Welcome to TeensNext!",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Bree Serif',
              fontSize: 24,
              decoration: TextDecoration.none,
            ),
          ),
          const Text(
            "Tap 'Agree and Continue' to accept our Terms and Conditions",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Bree Serif',
              fontSize: 12,
              height: 12,
              decoration: TextDecoration.none,
            ),
          ),
          TermsAndConditions(
            onPressed: () {},
          ),
          StartButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const AuthPage()));
            },
          ),
          */
        ],
      ),
    );
  }
}

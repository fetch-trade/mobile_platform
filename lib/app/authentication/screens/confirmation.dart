// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fetch/app/authentication/components/components.dart';
import 'package:fetch/app/authentication/screens/forgot_password.dart';
import 'package:fetch/app/screens/screens.dart';
import 'package:fetch/components/components.dart';
import 'package:fetch/providers/gauth_provider.dart';
import 'package:provider/provider.dart';
import 'package:fetch/services/auth_service.dart';

// ignore: must_be_immutable
class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          e.toString(),
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Capriola',
            fontSize: 12,
          ),
        )),
      );
    }

    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // create account for TeensNext!
                const Text(
                  "Confirm credentials",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Capriola',
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 48),
                // email textfield
                InputField(
                  controller: emailController,
                  width: 440,
                  height: 80,
                  maxLines: 1,
                  maxLength: TextField.noMaxLength,
                  autocorrect: false,
                  obscureText: false,
                  align: TextAlign.left,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  textStyle: const TextStyle(
                      color: Colors.black, fontFamily: 'REM', fontSize: 18),
                  inputDecoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'REM',
                        fontSize: 18),
                  ),
                ),

                // password textfield
                InputField(
                  controller: passwordController,
                  width: 440,
                  height: 80,
                  maxLines: 1,
                  maxLength: 12,
                  autocorrect: false,
                  obscureText: true,
                  align: TextAlign.left,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  textStyle: const TextStyle(
                      color: Colors.black, fontFamily: 'REM', fontSize: 18),
                  inputDecoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'REM',
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // sign in button
                EnterButton(
                  text: "Sign in",
                  onTap: signUserIn,
                  color: Colors.black,
                ),
                const SizedBox(height: 48),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        onTap: () => GAuthProvider().signInWithGoogle(),
                        imagePath: 'assets/imgs/google.svg'),
                    const SizedBox(width: 24),

                    // apple button
                    SquareTile(
                        onTap: () => {}, imagePath: 'assets/imgs/apple.svg'),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

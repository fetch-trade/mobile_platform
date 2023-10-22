// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teens_next/app/authentication/components/components.dart';
import 'package:teens_next/app/authentication/screens/user_name.dart';
import 'package:teens_next/components/components.dart';
import 'package:teens_next/providers/gauth_provider.dart';
import 'package:teens_next/services/auth_service.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;

  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Passwords do not match!",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Capriola',
          fontSize: 12,
        ),
      )));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const UserName()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
        style: const TextStyle(
          fontFamily: 'Capriola',
          fontSize: 12,
        ),
      )));
    }
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
                  "New? Create an account!",
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

                // confirm password textfield
                InputField(
                  controller: confirmPasswordController,
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
                    hintText: "Confirm password",
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'REM',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 24),

                // sign up button
                EnterButton(
                  text: "Sign up",
                  onTap: signUserUp,
                ),
                const SizedBox(height: 48),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Or continue with',
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

                // already a member? sign in now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign in now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

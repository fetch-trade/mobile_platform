// ignore_for_file: use_build_context_synchronously

import 'package:fetch/app/authentication/screens/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fetch/app/authentication/components/components.dart';
import 'package:fetch/components/components.dart';
import 'package:fetch/providers/gauth_provider.dart';
import 'package:fetch/services/auth_service.dart';

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
          fontFamily: 'Quicksand',
          fontSize: 12,
        ),
      )));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
        style: const TextStyle(
          fontFamily: 'Quicksand',
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
                  "New? Sign up now!",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black))),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'REM',
                                        fontWeight: FontWeight.w200)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black))),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'REM',
                                        fontWeight: FontWeight.w200)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'REM',
                                        fontWeight: FontWeight.w200)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const Text(""),
                      )
                    ],
                  ),
                ),
                // email textfield
                /*
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
                */

                // sign up button
                EnterButton(
                  text: "Continue",
                  color: const Color.fromARGB(255, 218, 44, 90),
                  onTap: signUserUp,
                ),
                const SizedBox(height: 32),

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

                // already a member? sign in now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Sign in now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 218, 44, 90),
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

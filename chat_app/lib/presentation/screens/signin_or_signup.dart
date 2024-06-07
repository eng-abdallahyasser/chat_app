import 'package:chat_app/presentation/screens/signin_screen.dart';
import 'package:chat_app/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SigninOrSignup extends StatefulWidget {
  const SigninOrSignup({super.key});

  @override
  State<SigninOrSignup> createState() => _SigninOrSignupState();
}

class _SigninOrSignupState extends State<SigninOrSignup> {
  bool signInPage = true;

  void togglePages() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage) {
      return SignInScreen(
        onTap: togglePages,
      );
    } else {
      return SignUpScreen(
        onTap: togglePages,
      );
    }
  }
}

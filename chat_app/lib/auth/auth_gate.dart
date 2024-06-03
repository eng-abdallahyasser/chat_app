import 'package:chat_app/presentation/screens/home.dart';
import 'package:chat_app/presentation/screens/signin_or_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return const Home();
            } else {
              return const SigninOrSignup();
            }
          }),
    );
  }
}

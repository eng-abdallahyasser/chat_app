import 'package:chat_app/constant.dart';
import 'package:chat_app/presentation/screens/chatpage.dart';
import 'package:chat_app/presentation/screens/home.dart';
import 'package:chat_app/presentation/screens/signin_or_signup.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings route) {
    switch (route.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => Home());
      case signinOrSignupScreen:
        return MaterialPageRoute(builder: (context) => const SigninOrSignup());
      case chatScreen:
        return MaterialPageRoute(builder: (context) => ChatPage(name: "place holder" ,receiverId: "",));
      default:
        return MaterialPageRoute(
            builder: (context) => const SigninOrSignup());
    }
  }
}

import 'package:chat_app/constant.dart';
import 'package:chat_app/presentation/screens/chatpage.dart';
import 'package:chat_app/presentation/screens/home.dart';
import 'package:chat_app/presentation/screens/signin.dart';
import 'package:chat_app/presentation/screens/signup.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings route) {
    switch (route.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      case signinScreen:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case chatScreen:
        return MaterialPageRoute(builder: (context) => const ChatPage());
      default:
        return MaterialPageRoute(
            builder: (context) => const SignIn());
    }
  }
}

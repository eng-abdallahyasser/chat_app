import 'package:chat_app/presentation/screens/chatpage.dart';
import 'package:chat_app/presentation/screens/home.dart';
import 'package:chat_app/presentation/screens/signin.dart';
import 'package:chat_app/presentation/screens/signup.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Home());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (context) => const SignUp());
      case '/chat_page':
        return MaterialPageRoute(builder: (context) => const ChatPage());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))));
    }
  }
}

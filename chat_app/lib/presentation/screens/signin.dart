import 'package:chat_app/constant.dart';
import 'package:chat_app/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF7f30fe),
                    Color(0xFF6380fb),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 106.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )),
                  const Center(
                      child: Text(
                    "Login to your account",
                    style: TextStyle(
                        color: Color(0xFFbbb0ff),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        // height: MediaQuery.of(context).size.height / 2,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10.0),
                            const MyTextfield(),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xff7f30fe),
                                    )),
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: const Text("Forgetten Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, homeScreen);
                                },
                                child: Container(
                                  width: 200,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff7f30fe),
                                          width: 2),
                                      // color: const ,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff7f30fe),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "I don't have acount.",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, signupScreen);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff7f30fe),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

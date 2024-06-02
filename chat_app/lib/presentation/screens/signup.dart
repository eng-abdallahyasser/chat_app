import 'package:chat_app/constant.dart';
import 'package:chat_app/presentation/widgets/my_button.dart';
import 'package:chat_app/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final void Function()? onTap;
  const SignUp({super.key, this.onTap});

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
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7f30fe),
                    Color(0xFF6380fb),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    105,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70.0,
              ),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Create a new account',
                      style: TextStyle(
                        color: Color(0xFFbbb0ff),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const MyTextfield(hintText: 'Name'),
                            const SizedBox(
                              height: 20,
                            ),
                            const MyTextfield(hintText: 'Email'),
                            const SizedBox(
                              height: 20,
                            ),
                            const MyTextfield(hintText: 'Password'),
                            const SizedBox(
                              height: 20,
                            ),
                            const MyTextfield(hintText: 'Confirm password'),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, signinScreen);
                                },
                                child: const MyButton(
                                  text: "Sign Up",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "I already have acount.",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: const Text(
                            "Sign In, Now",
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
            ),
          ],
        ),
      ),
    );
  }
}

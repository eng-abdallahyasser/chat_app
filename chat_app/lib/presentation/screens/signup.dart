import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                            const Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.black38,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: Color(0xFF7f30fe),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.black38,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: Color(0xFF7f30fe),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.black38,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Color(0xFF7f30fe),
                                  ),
                                ),
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Confirm password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.black38,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Color(0xFF7f30fe),
                                  ),
                                ),
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  " Sign Up Now",
                                  style: TextStyle(
                                    color: Color(0xFF7f30fe),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF6380fb,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

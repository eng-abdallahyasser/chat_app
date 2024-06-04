import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/presentation/widgets/my_button.dart';
import 'package:chat_app/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;
  SignIn({super.key, this.onTap});

  void signIn() async {
    final authService = AuthService();
    try {
      await authService.signInByEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      print("2312 $e");
    }
  }

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
                            const SizedBox(height: 10.0),
                            MyTextfield(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(height: 10.0),
                            MyTextfield(
                              controller: _pwController,
                              hintText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("I forgetten my password, ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400)),
                                Text("Reset it.",
                                    style: TextStyle(
                                        color: Color(0xff7f30fe),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: signIn,
                                child: const MyButton(text: "Sign In"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I don't have acount, ",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: const Text(
                            "Sign Up Now",
                            style: TextStyle(
                              fontSize: 18.0,
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

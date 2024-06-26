import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/presentation/widgets/my_button.dart';
import 'package:chat_app/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final void Function()? onTap;
  SignUpScreen({super.key, this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  final TextEditingController _confirmPwController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;

  final auth = AuthService();

  void signUp(BuildContext context) {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _pwController.text.isNotEmpty &&
        _confirmPwController.text.isNotEmpty) {
      if (_pwController.text == _confirmPwController.text) {
        try {
          auth.signUpByEmailPassword(
              _nameController.text, _emailController.text, _pwController.text);
        } catch (e) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Passwords don't match!"),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("You have to input all fields"),
              ));
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
                      color: Colors.white,
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
                            MyTextfield(
                              hintText: 'Name',
                              controller: _nameController,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextfield(
                              hintText: 'Email',
                              controller: _emailController,
                              obscureText: false,                              
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Expanded(
                                child: MyTextfield(
                                  hintText: 'Password',
                                  controller: _pwController,
                                  obscureText: showPassword,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined))
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Expanded(
                                child: MyTextfield(
                                  hintText: 'Confirm password',
                                  controller: _confirmPwController,
                                  obscureText: showConfirmPassword,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showConfirmPassword =
                                          !showConfirmPassword;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined))
                            ]),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () => signUp(context),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I already have acount, ",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Sign In Now",
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
            ),
          ],
        ),
      ),
    );
  }
}

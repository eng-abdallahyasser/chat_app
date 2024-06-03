import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/presentation/widgets/my_drawer.dart';
import 'package:chat_app/presentation/widgets/my_icon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xffc199cd), //change your color here
        ),
        backgroundColor: const Color(0xFF553370),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'ChatApp',
                style: TextStyle(
                  color: Color(0xffc199cd),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const MyIcon(icon: Icons.search),
            IconButton(
              onPressed: logout,
              icon: const MyIcon(icon: Icons.logout),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF553370),
      drawer: const MyDrawer(),
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(
            // vertical: 30,
            horizontal: 20,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            children: [
              for (int i = 0; i < 16; i++)
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, chatScreen);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/images/boy${i % 3}.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Hossam Elyamany',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Hello, What are you doing?',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '04:30 PM',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}

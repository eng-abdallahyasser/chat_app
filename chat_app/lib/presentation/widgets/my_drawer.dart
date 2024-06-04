import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/presentation/widgets/my_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

    void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              child: const Text(
                "My Chat App",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF553370)),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const MyIcon(icon: Icons.home),
                  title: const Text(
                    "H O M E",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const MyIcon(icon: Icons.person),
                  title: const Text(
                    "P R O F I L E",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const MyIcon(icon: Icons.settings),
                  title: const Text(
                    "S E T T I N G",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          ListTile(
            leading: const MyIcon(icon: Icons.logout),
            title: const Text(
              "L O G O U T",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: logout,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

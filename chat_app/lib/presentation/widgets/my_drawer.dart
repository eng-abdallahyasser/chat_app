import 'package:chat_app/presentation/screens/profile_screen.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/presentation/widgets/my_icon.dart';
import 'package:chat_app/services/storage/storege_services.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final _authService = AuthService();
  final StoregeServices _storegeServices = StoregeServices();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: FutureBuilder(
                    future: _storegeServices
                        .getProfilePic(_authService.getCurrentUser()!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasError ||
                          (!snapshot.hasData || snapshot.data == null)) {
                        return Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/placeholder.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(snapshot.data!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
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
            onTap: _authService.signOut,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

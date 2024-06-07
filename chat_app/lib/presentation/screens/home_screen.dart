import 'package:chat_app/presentation/screens/chat_screen.dart';
import 'package:chat_app/presentation/widgets/my_drawer.dart';
import 'package:chat_app/presentation/widgets/my_icon.dart';
import 'package:chat_app/presentation/widgets/user_tile.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  HomeScreen({super.key});

  Widget _buildUserItem(Map<String, dynamic> user, BuildContext context) {
    if (user['email'] != authService.getCurrentUser()!.email) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      name: user['name'],
                      receiverId: user['uid'],
                    )),
          );
        },
        child: UserTile(user: user),
      );
    } else {
      return Container();
    }
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
            GestureDetector(
              onTap: () {
                // print(chatService.getUserStream().first);
              },
              child: const MyIcon(icon: Icons.search),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF553370),
      drawer: MyDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: StreamBuilder(
            stream: chatService.getUsersStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!
                    .map<Widget>(
                        (userdata) => _buildUserItem(userdata, context))
                    .toList(),
              );
            }),
      ),
    );
  }
}

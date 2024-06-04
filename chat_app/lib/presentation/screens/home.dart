import 'package:chat_app/presentation/screens/chatpage.dart';
import 'package:chat_app/presentation/widgets/my_drawer.dart';
import 'package:chat_app/presentation/widgets/my_icon.dart';
import 'package:chat_app/presentation/widgets/user_tile.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final ChatService chatService = ChatService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xffc199cd), //change your color here
        ),
        backgroundColor: const Color(0xFF553370),
        title: const Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'ChatApp',
                style: TextStyle(
                  color: Color(0xffc199cd),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MyIcon(icon: Icons.search),
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
            child: StreamBuilder(
                stream: chatService.getUserStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView(
                      children: snapshot.data!
                          .map(
                            (userdata) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>ChatPage(name: userdata["name"])),
                                );
                              },
                              child: UserTile(user: userdata),
                            ),
                          )
                          .toList(),
                    );
                  }
                })),
      ),
    );
  }
}

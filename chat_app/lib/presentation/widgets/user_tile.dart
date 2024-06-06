import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTile extends StatelessWidget {
  final Map<String, dynamic> user;
  final AuthService authService = AuthService();
  final ChatService chatService = ChatService();

  UserTile({super.key, required this.user});

  Widget _buildLastMsg() {
    return FutureBuilder(
      future: chatService.getLastMessage(
          authService.getCurrentUser()!.uid, user['uid']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (((snapshot.data as Map<String, dynamic>)['senderId']) ==
                authService.getCurrentUser()!.uid)
              const Text(
                "Me :  ",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            else
              const Text(
                "him :  ",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            Text(
              (snapshot.data as Map<String, dynamic>)['message'],
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLastMsgDate() {
    return FutureBuilder(
      future: chatService.getLastMessage(
          authService.getCurrentUser()!.uid, user['uid']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              DateFormat('hh:mm a').format(((snapshot.data
                      as Map<String, dynamic>)['timestamp'] as Timestamp)
                  .toDate()),
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              DateFormat('yyyy  MM/dd').format(((snapshot.data
                      as Map<String, dynamic>)['timestamp'] as Timestamp)
                  .toDate()),
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              "assets/images/placeholder.jpg",
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user["name"],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _buildLastMsg(),
            ],
          ),
          const Spacer(),
          _buildLastMsgDate(),
        ],
      ),
    );
  }
}

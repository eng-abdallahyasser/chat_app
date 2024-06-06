import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firebaseFirestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverId, message) async {
    final String senderId = _auth.getCurrentUser()!.uid;
    final String senderName = _auth.getCurrentUser()!.displayName!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderName: senderName,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
      senderId: senderId,
    );
    List<String> ids = [receiverId, senderId];
    ids.sort();
    String chatRoomId = ids.join('_');
    await _firebaseFirestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String senderId, receiverId) {
    List<String> ids = [receiverId, senderId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firebaseFirestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  // String getLastMessage(String senderId, receiverId) {
  //   List<String> ids = [receiverId, senderId];
  //   ids.sort();
  //   String chatRoomId = ids.join('_');

  //   return _firebaseFirestore
  //       .collection('chat_room')
  //       .doc(chatRoomId)
  //       .collection("messages")
  //       .orderBy("timestamp", descending: false);
  // }

  Future<Map<String,dynamic>> getLastMessage(String senderId, String receiverId) async {
    // Ensure ids are in alphabetical order to form a consistent chat room ID
    List<String> ids = [receiverId, senderId];
    ids.sort();
    String chatRoomId = ids.join('_');

    // Query the messages sub-collection ordered by timestamp in descending order
    var querySnapshot = await _firebaseFirestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    // Check if there's any message and return the last message
    if (querySnapshot.docs.isNotEmpty) {
      var lastMessageDoc = querySnapshot.docs.first;
      return lastMessageDoc.data(); 
    } else {
      return {'message' :'No messages yet'};
    }
  }
}

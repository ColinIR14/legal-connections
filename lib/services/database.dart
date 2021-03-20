import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByEmail(String email) {
    return FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: email).get();
  }


  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users")
        .add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    FirebaseFirestore.instance.collection("chatroom")
        .doc(chatRoomID).set(chatRoomMap).catchError((e) {
          print(e.toString());
    });
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance.collection("chatroom").doc(chatRoomId).collection("chats")
        .orderBy('time').snapshots();
  }
}
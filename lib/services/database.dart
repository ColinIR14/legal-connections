import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legal_app/services/constants.dart';
import '../pages/classes/users.dart';

class DatabaseMethods {
  getUserByEmail(String email) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future<OurUser> getOurUserbyEmail(String email) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();
      print(data.docs.first.data());
      return OurUser.fromData(data.docs.first.data());
    } catch (e) {
      print(e);
      print("hi");
      return null;
    }
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatRoomID)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String email) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: email)
        .snapshots();
  }

  getPosts() async {
    QuerySnapshot temp =
        await FirebaseFirestore.instance.collection('posts').get();
    final posts = temp.docs.map((doc) => doc.data()).toList();
    // print(posts);
    // print(posts.runtimeType);
    return posts;
  }

  createNewChat(OurUser otherUser) async {
    OurUser currUser = Constants.currUser;

    List<String> users = [currUser.email, otherUser.email];

    String chatID = getChatRoomId(currUser, otherUser);
    String chatNames = getChatNames(currUser, otherUser);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatID" : chatID,
      "chatNames" : chatNames
    };

    createChatRoom(chatID, chatRoom);

    return chatID;

  }

  getChatRoomId(OurUser user1, OurUser user2) {
    if (user1.type == "Lawyer") {
      return "${user1.email}\_${user2.email}";
    } else {
      return "${user2.email}\_${user1.email}";
    }
  }

  getChatNames(OurUser user1, OurUser user2) {
    if (user1.type == "Lawyer") {
      return "${user1.name}\_${user2.name}";
    } else {
      return "${user2.name}\_${user1.name}";
    }
  }
}

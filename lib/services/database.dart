import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legal_app/services/constants.dart';
import '../pages/classes/users.dart';

class DatabaseMethods {
  getUserByEmail(String email) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email.toLowerCase())
        .get();
  }

  Future<OurUser> getOurUserbyEmail(String email) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email.toLowerCase())
          .limit(1)
          .get();
      //print(data.docs.first.data());
      //return OurUser.fromData(data.docs.first.data());
      OurUser user =  OurUser.fromData(data.docs.first.data());
      if (user.type.toLowerCase() == 'lawyer') {
        var data = await getLawyerSpecialties(email);
        List<String> cats =  new List<String>.from(data.data()['specialties']);
        user.categories = cats;
        //print("Specialties received from database:");
        //print('Specialties: ${user.categories}');
      }

      return user;
    } catch (e) {
      //print(e);
      //print("hi");
      return null;
    }
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  uploadPost(postMap) {
    FirebaseFirestore.instance.collection("posts").add(postMap).catchError((e) {
      print(e.toString());
    });
  }

  uploadCase(caseMap) {
    FirebaseFirestore.instance.collection("cases").add(caseMap).catchError((e) {
      print(e.toString());
    });
  }

  uploadLawyerSpecialties(List<String> specialtyList, String lawyerEmail) {
    FirebaseFirestore.instance.collection("specialties").doc(lawyerEmail)
        .set({'specialties': specialtyList}).catchError((e) => print(e));
  }

  getLawyerSpecialties(String lawyerEmail) async {
    var specialties =  await FirebaseFirestore.instance.collection("specialties").doc(lawyerEmail)
        .get().catchError((e) => print(e));
    return specialties;
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
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }
  /*

  getUserChats(String email) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where('users', arrayContains: email)
        .snapshots();
  }*/

  getUserChats(String email) async {
    QuerySnapshot temp = await FirebaseFirestore.instance
        .collection("chatroom")
        .where('users', arrayContains: email).get();
    final chats = temp.docs.map((doc) => doc.data()).toList();
    return chats;
  }



  Future<List<Map>> getPosts() async {
    QuerySnapshot temp =
        await FirebaseFirestore.instance.collection('posts').get();
    final posts = temp.docs.map((doc) => doc.data()).toList();
    // print(posts);
    // print(posts.runtimeType);
    return posts;
  }

  Future<List<Map>> getCases(OurUser user) async {
    if (user.type.toLowerCase() == 'client') {
      QuerySnapshot temp = await FirebaseFirestore.instance
          .collection("cases")
          .where('user', isEqualTo: user.email).get();
      final cases = temp.docs.map((doc) => doc.data()).toList();
      return cases;
    } else {
      //print(user.categories);
      QuerySnapshot temp = await FirebaseFirestore.instance
          .collection("cases")
          .where('category', whereIn: user.categories).get();
      final cases = temp.docs.map((doc) => doc.data()).toList();
      return cases;
    }
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

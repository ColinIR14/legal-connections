import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_app/main.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/chat_screen.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';

class MessageCard extends StatelessWidget {
  OurUser user;
  String email;
  String name;
  String recent_msg;

  MessageCard(String name, OurUser user, String recent_msg) {
    this.name = name;
    this.user = user;
    this.email = user.email;
    this.recent_msg = recent_msg;
  }

  initOurUser() async {
    await dbMethods.getOurUserbyEmail(this.email).then((user) => this.user = user);
  }

  DatabaseMethods dbMethods = new DatabaseMethods();
  static AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100], width: 1.0),
          bottom: BorderSide(color: Colors.grey[100], width: 1.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          print('tapped');
          print(user.name);
          createNewChat(context);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profile_pic != null ? user.profile_pic :
                  'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Text(
                    '${user.name}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Text(
                    '$recent_msg',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  createNewChat(context) async {
    OurUser currUser = await auth.getOurUserWithData();

    List<String> users = [currUser.email, user.email];

    String chatRoomId = getChatRoomId(currUser, user);
    String chatNames = getChatNames(currUser, user);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatID": chatRoomId,
      "chatNames": chatNames
    };

    dbMethods.createChatRoom(chatRoomId, chatRoom);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatScreen(
                  chatID: chatRoomId,
                )));
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

class MyLinksPage extends StatelessWidget {
  List<MessageCard> messages;
  DatabaseMethods dbMethods = new DatabaseMethods();

  MyLinksPage(List<MessageCard> messages) {
    this.messages = messages;
  }

  MyLinksPage.us() {
    this.messages = null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages,
    );
  }
}

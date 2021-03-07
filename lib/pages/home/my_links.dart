import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';

class MessageCard extends StatelessWidget {
  OurUser user;
  String recent_msg;

  MessageCard(OurUser user, String recent_msg) {
    this.user = user;
    this.recent_msg = recent_msg;
  }

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
                  image: NetworkImage(user.profile_pic),
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
}

class MyLinksPage extends StatelessWidget {
  List<MessageCard> messages;

  MyLinksPage(List<MessageCard> messages) {
    this.messages = messages;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages,
    );
  }
}

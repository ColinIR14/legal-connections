import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/chat_screen.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';


class ChatScreen extends StatefulWidget {
  final String chatID;

  ChatScreen({this.chatID});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();
  static AuthService auth = AuthService();
  OurUser currUser;

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return MessageTile(
                message: snapshot.data.documents[index].data["message"],
                sentByMe:  currUser.email == snapshot.data.documents[index].data["sendBy"],
              );
            }
        ) : Container();
      }
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": auth.currEmail,
        "message": messageEditingController.text,
        "time": DateTime
            .now()
            .millisecondsSinceEpoch,
      };

      DatabaseMethods().addMessage(widget.chatID, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            chatMessages()

            //buildInput(),
          ]
        )
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sentByMe;

  MessageTile({@required this.message, @required this.sentByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sentByMe ? 0 : 24,
          right: sentByMe ? 24 : 0),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sentByMe
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(
            top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sentByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sentByMe ? [
                const Color(0xff007EF4),
                const Color(0xff2A75BC)
              ]
                  : [
                const Color(0x1AFFFFFF),
                const Color(0x1AFFFFFF)
              ],
            )
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                //fontFamily: 'OverpassRegular',
                //fontWeight: FontWeight.w300)),
      ),
    )));
  }
}


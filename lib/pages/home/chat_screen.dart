import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatID;

  ChatScreen({this.chatID});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return MessageTile(
              );
            }
        ) : null;
      }
    );
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



  Widget buildInput() {

  }
}

class MessageTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

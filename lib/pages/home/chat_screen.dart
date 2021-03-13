import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            buildMessages(),

            buildInput(),
          ]
        )
      ),
    );
  }

  Widget buildMessages() {

  }

  Widget buildInput() {

  }
}
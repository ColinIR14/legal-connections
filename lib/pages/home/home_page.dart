import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/post_card.dart';
import 'package:legal_app/services/auth.dart';

class HomeMenu extends StatelessWidget {
  List<PostCard> posts;

  final AuthService _auth = AuthService();

  HomeMenu(List<PostCard> posts) {
    this.posts = posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            label: Text('logout'),
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],

        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey,
        ),
      ),


      body: ListView(
        children: this.posts,

    ));
  }
}

import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/post_card.dart';

class HomeMenu extends StatelessWidget {
  List<PostCard> posts;

  HomeMenu(List<PostCard> posts) {
    this.posts = posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: ListView(
        children: this.posts,
      ),
    );
  }
}

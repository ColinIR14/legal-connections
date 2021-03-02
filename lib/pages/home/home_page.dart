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
      appBar: AppBar(),
      body: ListView(
        children: this.posts,
      ),
    );
  }
}

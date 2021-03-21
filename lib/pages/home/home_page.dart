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
    return ListView(
      children: this.posts,
    );
  }
}

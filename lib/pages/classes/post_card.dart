import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';

class Comments {
  User commenter;
  String comment;

  Comments(User commenter, String comment) {
    this.commenter = commenter;
    this.comment = comment;
  }
}

class Post {
  String pic; //change this after
  String text;
  DateTime post_time;
  List<Comments> comments;
  int likes;

  Post(String pic, String text, DateTime post_time, List<Comments> comments,
      int likes) {
    this.pic = pic;
    this.text = text;
    this.post_time = post_time;
    this.comments = comments;
    this.likes = likes;
  }
}

class PostCard extends StatefulWidget {
  User poster;
  Post post;

  PostCard(User poster, Post post) {
    this.poster = poster;
    this.post = post;
  }

  @override
  _PostCardState createState() => _PostCardState(this.poster, this.post);
}

class _PostCardState extends State<PostCard> {
  User poster;
  Post post;

  Map like_color = {true: Colors.red, false: Colors.grey};
  bool liked = false;

  _PostCardState(User poster, Post post) {
    this.poster = poster;
    this.post = post;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(poster.profile_pic),
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
                      '${poster.name}',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      '${poster.location}', // change this later to be field of experience
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  // need to add a time thing after adding to structure of class. posts should be an attribute of the user class. we need a posts class with pic, time, comments, likes, etc
                ],
              ),
            ],
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.pic),
                fit: BoxFit
                    .fitHeight, // this part may need to be changed depending on the aspect ratio of images allowed. should crop/fit better
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {
                setState(() {
                  liked = !liked;
                  //need to update like count and send to server after
                });
              },
              icon: Icon(
                Icons.favorite_rounded,
                color: like_color[liked],
              ),
            ),
          ),
          Container(
            width: 300,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
                TextSpan(
                    text: poster.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '  '),
                TextSpan(text: post.text),
              ]),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _generate_comments(),
              ))
        ],
      ),
    );
  }

  List<Widget> _generate_comments() {
    List<Widget> comment_list = [];

    for (var i = 0; i < this.post.comments.length; i++) {
      comment_list.add(RichText(
          text: TextSpan(style: TextStyle(color: Colors.black), children: [
        TextSpan(
            text: this.post.comments[i].commenter.name,
            style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '  '),
        TextSpan(text: this.post.comments[i].comment)
      ])));
    }
    return comment_list;
  }
}

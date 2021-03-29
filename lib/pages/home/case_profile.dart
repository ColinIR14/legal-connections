import 'package:flutter/material.dart';
import '../classes/users.dart';

class CaseProfile extends StatelessWidget {
  OurUser client;
  String category;
  String text;
  List<String> photos;

  CaseProfile(
      OurUser client, String category, String text, List<String> photos) {
    this.client = client;
    this.category = category;
    this.text = text;
    this.photos = photos;
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(client.profile_pic),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // child: Image.network(client.profile_pic)
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${client.name}',
                        style: TextStyle(
                          fontSize: 35.0,
                        ),
                      ),
                      Text(
                        '${client.location}',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                  child: Text(
                category, //this needs to be changed: may mot be first case
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )),
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: Text(
                    text, //also  needs to be changed
                    textAlign: TextAlign.left,
                  )),
              Gallery(photos),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Link Up!',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.lightBlue[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  List<String> pics;

  Gallery(List<String> pics) {
    this.pics = pics;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._generate_gallery(),
    );
  }

  List<Widget> _generate_gallery() {
    List<Widget> lst = [];
    if (pics == null) {
      return lst;
    }
    lst.add(this._generate_row_one(pics[0]));

    var len = pics.length;
    for (var i = 1; i < len; i += 2) {
      if (i == len - 1) {
        lst.add(this._generate_row_one(pics[i]));
      } else {
        lst.add(this._generate_row_two(pics[i], pics[i + 1]));
      }
    }
    return lst;
  }

  Widget _generate_row_one(String pic) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: FlatButton(
        onPressed: () {
          print('pic');
        },
        padding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            width: 315.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pic),
                fit: BoxFit.fill,
              ),
            ),
            // child: Image.network(pic)
          ),
        ),
      ),
    );
  }

  Widget _generate_row_two(String pic1, String pic2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: FlatButton(
            onPressed: () {
              print('pic1');
            },
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(pic1),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Image.network(pic1)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: FlatButton(
            onPressed: () {
              print('pic2');
            },
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(pic2),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Image.network(pic2)),
            ),
          ),
        ),
      ],
    );
  }
}

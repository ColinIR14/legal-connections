import 'package:flutter/material.dart';
import 'wanna_create_profile.dart';

class LegalSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LawLink',
          style: TextStyle(color: Colors.lightBlue[700]),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 20.0, left: 30.0, right: 30.0),
                child: Text(
                  "What kind of lawyer or legal aid do you need?",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Administrative Law',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[900],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Appellate',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[900],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Bankruptcy',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[800],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Civil Litigation',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[800],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Corporate',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[700],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Criminal',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[700],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Employment',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[600],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Family',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.blue[600],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Immigration',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[500],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'In-house',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[500],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Malpractice Law',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[400],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Personal Injury',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[400],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Poverty',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[300],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Real Estate',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[300],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Tax',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[200],
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  },
                  child: Text(
                    'Wills & Estates',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.blue[200],
                ),
              ),
            ],
          ),
        ),
        //],
      ),
    );
    // );
  }
}

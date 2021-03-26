import 'package:flutter/material.dart';
import 'legal_selection.dart';

class Searching extends StatelessWidget {
  createpopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Please return when you need a lawyer or legal aid.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          'LawLink',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 130.0, bottom: 80.0, left: 30.0, right: 30.0),
            child: Text(
              "Are you currently searching for a lawyer of any form of legal aid?",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 150,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 150,
                child: RaisedButton(
                  onPressed: () {
                    createpopup(context);
                  },
                  child: Text(
                    'Not Now',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'upload_case_details.dart';
import '../wrapper.dart';

class UploadQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          'LawLink',
          style: TextStyle(color: Colors.blueAccent),
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
              "Would you like up to upload details of your case now?",
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
                        MaterialPageRoute(builder: (context) => CaseDetails()));
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
                    Navigator.pushNamed(context, 'page_wrapper');
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

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: InitScreen()));
}

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.mail)),
                    TextSpan(
                      text: 'Temp Text',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.lightBlue[700],
                  child: Text(
                    'Join Us',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 5.0, 0, 30.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style:
                      TextStyle(color: Colors.lightBlue[700], fontSize: 30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:legal_app/pages/authenticate/login_page.dart';

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
              child: Container(
                child: new Image.asset('assets/LawLink Logo.png'),
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'sign_up');
                  },
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
                onPressed: () {
                  Navigator.of(context).pushNamed('login');
                },
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

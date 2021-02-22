import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          onChanged: (val) {
                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          obscureText: true,
                          onChanged: (val) {

                          }
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.blue[400],
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {

                          }
                      )
                    ]
                )

            )
        )
    );
  }
}


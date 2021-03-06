import 'package:flutter/material.dart';
import 'package:legal_app/services/auth.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
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
              key: _formKey,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter email' : null,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Email *',
                          ),
                          onChanged: (val) {
                            setState(() => email=val);
                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) => val.length <= 5 ? 'Enter password (>5 chars)' : null,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Password *',
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password=val);
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
                      ),
                      RaisedButton(
                        child: Text('Anon'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() => error = 'Sign in failed');
                            } else {
                              Navigator.pushNamed(context, 'cases_menu');
                            }
                          }
                        }),
                      SizedBox(height: 12.0),
                      Text(error, style: TextStyle(color: Colors.black, fontSize: 14.0),),
                    ]
                )

            )
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:legal_app/pages/authenticate/legal_selection.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';
import '../home/cases_menu.dart';
import '../classes/scroll_menu.dart';
import 'searching_for_legal_aid.dart';
import 'legal_selection.dart';
import 'lawyer_expertise_selection.dart';
// CaseCard whatever = CaseCard(
//     'Name',
//     'Location',
//     'Service',
//     'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
//     'sfsfdkhjsfjhssfdjhgfjkhdkfdgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggjghsdjgdfhkhjgkjhgfkjhsfdjhkdgfjhkgfjkhgfjh');

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String first = '';
  String last = '';
  String email = '';
  String password = '';
  String type = '';
  String error = '';
  String isClient = '';
  DatabaseMethods databaseMethods = new DatabaseMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
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
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter first name' : null,
                        decoration: const InputDecoration(
                          // icon: Icon(Icons.person),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'First Name *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => first = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter last name' : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Last Name *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => last = val);
                        }),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(),
                      hint: Text('Are you a Client or Lawyer?'),
                      validator: (val) => val.isEmpty ? 'What are you?' : null,
                      items: <String>['Client', 'Lawyer'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => type = value);
                        isClient = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter email' : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: 'Email *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) => val.length <= 5
                            ? 'Enter password (>5 chars)'
                            : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: 125,
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              Map<String, String> userInfoMap = {
                                "email": email,
                                "name": first + " " + last,
                                "type": type
                              };

                              databaseMethods.uploadUserInfo(userInfoMap);
                              if (result == null) {
                                setState(() => error = 'Invalid values');
                              } else {
                                if (isClient == 'Client') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Searching()));
                                } else if (isClient == 'Lawyer') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Expertise()));
                                }
                              }
                            }
                          }),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
            )));
  }
}

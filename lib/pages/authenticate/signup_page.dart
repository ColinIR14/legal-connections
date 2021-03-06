import 'package:flutter/material.dart';
import 'package:legal_app/services/auth.dart';
import '../home/cases_menu.dart';
import '../classes/scroll_menu.dart';

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
            child: Form(
              key: _formKey,
                child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter first name' : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'First Name *',
                  ),
                  onChanged: (val) {
                    setState(() => first=val);

                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter last name' : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Last Name *',
                  ),
                  onChanged: (val) {
                    setState(() => last=val);

                  }),
              SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    validator: (val) => val.isEmpty ? 'What are you?' : null,
                    items: <String>['Client', 'Lawyer'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => type=value);
                    },
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter email' : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Email *',
                  ),
                  onChanged: (val) {
                    setState(() => email=val);
                  }),
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
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Invalid values');
                      } else {
                        Navigator.pushNamed(context, 'cases_menu');
                      }
                    }

                  }),
                  SizedBox(height: 12.0),
                  Text(error, style: TextStyle(color: Colors.black, fontSize: 14.0),),
            ]))));
  }
}

import 'package:flutter/material.dart';
import 'cases_menu.dart';
import 'classes/scroll_menu.dart';

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
                child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'First Name *',
                  ),
                  onChanged: (val) {}),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Last Name *',
                  ),
                  obscureText: true,
                  onChanged: (val) {}),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Email *',
                  ),
                  obscureText: true,
                  onChanged: (val) {}),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                  onChanged: (val) {}),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'cases_menu');
                  })
            ]))));
  }
}
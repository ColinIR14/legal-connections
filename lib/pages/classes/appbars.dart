import 'package:flutter/material.dart';
import 'package:legal_app/pages/wrapper.dart';
import 'package:legal_app/services/auth.dart';

class DefaultAppbar extends AppBar {
  DefaultAppbar(String title)
      : super(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            child: Container(
              color: Colors.grey[100],
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0),
          ),
        );
}

class AuthAppBar extends AppBar {
  AuthAppBar(AuthService auth, String title)
      : super(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              label: Text('logout'),
              icon: Icon(Icons.person),
              onPressed: () async {
                await auth.signOut();
              },
            )
          ],
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.grey,
          ),
        );
}

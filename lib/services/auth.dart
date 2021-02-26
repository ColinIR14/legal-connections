import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on Firebase User
  User _userFromFirebaseUser(User user) {

  }

  //sign in anon
  Future signInAnon() async {
    try {
      User user = (await _auth.signInAnonymously()).user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password

  //register with email & password

  //sign out
}
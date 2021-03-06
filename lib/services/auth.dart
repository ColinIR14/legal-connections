import 'package:firebase_auth/firebase_auth.dart';
import 'package:legal_app/pages/classes/post_card.dart';
import '../pages/classes/users.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on Firebase User
  OurUser _userFromFirebaseUser(User user) {
    return user != null ? OurUser(uid: user.uid): null;
  }

  Stream<OurUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in anon
  Future signInAnon() async {
    try {
      User user = (await _auth.signInAnonymously()).user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
}


}
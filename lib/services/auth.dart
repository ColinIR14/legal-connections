import 'package:firebase_auth/firebase_auth.dart';
import 'package:legal_app/services/constants.dart';
import '../pages/classes/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  String currEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on Firebase User
  OurUser _userFromFirebaseUser(User user) {
    return user != null ? OurUser(uid: user.uid) : null;
  }

  Future<OurUser> getOurUserWithData() async {
    currEmail = _auth.currentUser.email;
    String uid = _auth.currentUser.uid;
    try {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: currEmail)
          .limit(1)
          .get();
      return OurUser.fromData(data.docs.first.data());

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<OurUser> getOurUserbyEmail(String email) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();
      return OurUser.fromData(data.docs.first.data());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<OurUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getOurUser() {
    final OurUser user = _userFromFirebaseUser(_auth.currentUser);

    return user;
  }

  //sign in anon
  Future signInAnon() async {
    try {
      User user = (await _auth.signInAnonymously()).user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    currEmail = email;
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      Constants.currUser = await getOurUserWithData();
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String getCurrEmail() {
    return _auth.currentUser.email;
  }
}

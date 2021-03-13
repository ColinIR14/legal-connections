import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByEmail(String email) {
    FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: email).get();
  }


  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users")
        .add(userMap).catchError((e) {
      print(e.toString());
    });
  }
}
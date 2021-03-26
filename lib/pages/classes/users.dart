import 'package:flutter/foundation.dart';

class OurUser {
  String name;
  String location; //prob change this later to not string
  String profile_pic; //also change this later
  List<List<String>>
      cases; // A list of Lists (since one person many have multiple cases) where the inner list contains (Category, Case description)
  List<String> categories;
  List<String> other_pics; //also change this later
  String bio;
  String uid;
  String email;
  String type;

  OurUser({this.uid});

  OurUser.fromData(Map<String, dynamic> data)
      : name = data['name'],
        email = data['email'],
        type = data['type'],
        profile_pic = data['profile_pic'],
        location = data['location'];

  OurUser.n(
      String name,
      String location,
      String profile_pic,
      List<List<String>> cases,
      List<String> categories,
      List<String> other_pics,
      [String bio = 'No Bio.']) {
    this.name = name;
    this.location = location;
    this.profile_pic = profile_pic;
    this.cases = cases;
    this.categories = categories;
    this.other_pics = other_pics;
    this.bio = bio;
  }

  //get cases method
}

class Lawyer extends OurUser {
  Lawyer(
      String name,
      String location,
      String profile_pic,
      List<List<String>> cases,
      List<String> categories,
      List<String> other_pics,
      String bio)
      : super.n(
            name, location, profile_pic, cases, categories, other_pics, bio);
}

class Client extends OurUser {
  Client(
    String name,
    String location,
    String profile_pic,
    List<List<String>> cases,
    List<String> categories,
    List<String> other_pics,
  ) : super.n(name, location, profile_pic, cases, categories, other_pics);
}

import 'package:flutter/foundation.dart';

class User {
  String name;
  String location; //prob change this later to not string
  String profile_pic; //also change this later
  List<List<String>>
      cases; // A list of Lists (since one person many have multiple cases) where the inner list contains (Category, Case description)
  List<String> other_pics; //also change this later

  User(String name, String location, String profile_pic,
      List<List<String>> cases, List<String> other_pics) {
    this.name = name;
    this.location = location;
    this.profile_pic = profile_pic;
    this.cases = cases;
    this.other_pics = other_pics;
  }
}

class Lawyer extends User  {
  Lawyer(String name, String location, String profile_pic,
      List<List<String>> cases, List<String> other_pics) :
        super(name, location, profile_pic,
        cases, other_pics);
}

class Client extends User  {
  Client(String name, String location, String profile_pic,
      List<List<String>> cases, List<String> other_pics) :
        super(name, location, profile_pic,
          cases, other_pics);
}

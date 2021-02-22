import 'package:flutter/foundation.dart';

class Client {
  String name;
  String location; //prob change this later to not string
  String profile_pic; //also change this later
  List<List<String>>
      cases; // A list of Lists (since one person many have multiple cases) where the inner list contains (Category, Case description)
  List<String> other_pics; //also change this later

  Client(String name, String location, String profile_pic,
      List<List<String>> cases, List<String> other_pics) {
    this.name = name;
    this.location = location;
    this.profile_pic = profile_pic;
    this.cases = cases;
    this.other_pics = other_pics;
  }
}

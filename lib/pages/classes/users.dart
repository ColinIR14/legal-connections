import 'package:flutter/foundation.dart';

class User {
  String name;
  String location; //prob change this later to not string
  String profile_pic; //also change this later
  List<List<String>>
      cases; // A list of Lists (since one person many have multiple cases) where the inner list contains (Category, Case description)
  List<String> categories;
  List<String> other_pics; //also change this later
  String bio;

  User(
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
}

class Lawyer extends User {
  Lawyer(
      String name,
      String location,
      String profile_pic,
      List<List<String>> cases,
      List<String> categories,
      List<String> other_pics,
      String bio)
      : super(name, location, profile_pic, cases, categories, other_pics, bio);
}

class Client extends User {
  Client(
    String name,
    String location,
    String profile_pic,
    List<List<String>> cases,
    List<String> categories,
    List<String> other_pics,
  ) : super(name, location, profile_pic, cases, categories, other_pics);
}

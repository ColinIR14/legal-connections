import 'package:flutter/material.dart';
import 'pages/cases_menu.dart';
import 'pages/classes/scroll_menu.dart';
import 'pages/signup_page.dart';

CaseCard whatever = CaseCard(
    'Name',
    'Location',
    'Service',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'sfsfdkhjsfjhssfdjhgfjkhdkfdgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggjghsdjgdfhkhjgkjhgfkjhsfdjhkdgfjhkgfjkhgfjh');

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          body: SignupForm())
          //body: CasesMenu([whatever, whatever, whatever, whatever]
          ));
}

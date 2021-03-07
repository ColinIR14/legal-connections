import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/lawyer_profile.dart';

class Message {
  String pic; //change this after
  String text;
  DateTime messageTime;
  OurUser sender;
  OurUser recipient;

  Post(String pic, String text, DateTime messageTime, OurUser sender, OurUser recipient) {
    this.pic = pic;
    this.text = text;
    this.messageTime = messageTime;
    this.sender = sender;
    this.recipient = recipient;
  }
}
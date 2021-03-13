import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/lawyer_profile.dart';

class Message {
  static int currID = 1;
  int mid;
  String pic; //change this after
  String text;
  DateTime messageTime;
  OurUser sender;
  OurUser recipient;


  Message(String pic, String text, DateTime messageTime, OurUser sender, OurUser recipient) {
    this.mid = currID;
    currID += 1;
    this.pic = pic;
    this.text = text;
    this.messageTime = messageTime;
    this.sender = sender;
    this.recipient = recipient;
  }
}
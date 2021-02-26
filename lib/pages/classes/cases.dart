import 'package:flutter/material.dart';
import 'users.dart';

class Case {

  String name;
  Client client;
  Lawyer lawyer;

  Case(String name, Client client, Lawyer Lawyer) {
    this.name = name;
    this.client = client;
    this.lawyer = lawyer;
  }
}
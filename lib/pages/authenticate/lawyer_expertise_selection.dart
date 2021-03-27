import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/constants.dart';
import 'package:legal_app/services/database.dart';

class Expertise extends StatelessWidget {
  DatabaseMethods dbMethods = new DatabaseMethods();
  AuthService auth = new AuthService();


  @override
  Widget build(BuildContext context) {
    var selectedCat = <String>[];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          'LawLink',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 20.0, left: 30.0, right: 30.0),
                  child: Text(
                    "What is your expertise?",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add('Administrative Law');
                    },
                    child: Text(
                      'Administrative Law',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add('Appellate');
                    },
                    child: Text(
                      'Appellate',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add('Bankruptcy');
                    },
                    child: Text(
                      'Bankruptcy',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Civil Litigation");
                    },
                    child: Text(
                      'Civil Litigation',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Corporate");
                    },
                    child: Text(
                      'Corporate',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[700],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Criminal");
                    },
                    child: Text(
                      'Criminal',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[700],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Employment");
                    },
                    child: Text(
                      'Employment',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[700],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Family");
                    },
                    child: Text(
                      'Family',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    color: Colors.blue[700],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Immigration");
                    },
                    child: Text(
                      'Immigration',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[600],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("In-house");
                    },
                    child: Text(
                      'In-house',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[600],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Malpractice Law");
                    },
                    child: Text(
                      'Malpractice Law',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[600],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Personal Injury");
                    },
                    child: Text(
                      'Personal Injury',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[600],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Poverty");
                    },
                    child: Text(
                      'Poverty',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[500],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Real Estate");
                    },
                    child: Text(
                      'Real Estate',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[500],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Tax");
                    },
                    child: Text(
                      'Tax',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[500],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      selectedCat.add("Wills & Estates");
                    },
                    child: Text(
                      'Wills & Estates',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[500],
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(top: 30, bottom: 30.0),
                  child: RaisedButton(
                    onPressed: () {
                      List<String> refinedCat = selectedCat.toSet().toList();
                      print(refinedCat);
                      dbMethods.uploadLawyerSpecialties(refinedCat, auth.getCurrEmail());
                      Navigator.pushNamed(context, 'page_wrapper');
                      //Lawyer.categories = refinedCat;
                      OurUser().categories = refinedCat;
                      print(OurUser().categories);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
        ),
        //],
      ),
    );
    // );
  }
}

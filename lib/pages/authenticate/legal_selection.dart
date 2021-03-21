import 'package:flutter/material.dart';
import 'wanna_create_profile.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LegalSelection(title: 'LawLink'));
  }
}

class LegalSelection extends StatefulWidget {
  LegalSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LegalSelection> {
  createpopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Please select a legal branch.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.lightBlue[700],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  String valueChoose;
  List listItem = [
    "Administrative Law",
    "Appellate",
    'Bankruptcy',
    'Civil Litigation',
    'Corporate',
    'Criminal',
    'Employment',
    'Family',
    'Immigration',
    'In-house',
    'Malpractice Law',
    'Personal Injury',
    'Poverty',
    'Real Estate',
    "Tax",
    'Wills & Estates'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 40),
                  child: Text(
                    'What kind of lawyer or legal aid do you need?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: EdgeInsets.only(left: 18, right: 18),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('Select One'),
                    dropdownColor: Colors.grey[50],
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 30.0,
                    isExpanded: true,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  //if (valueChoose == null) ;
                  //{
                  //   createpopup(context);
                  // }
                  if (valueChoose != null) ;
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileQ()));
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                color: Colors.lightBlue[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

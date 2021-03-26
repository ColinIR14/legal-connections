import 'package:flutter/material.dart';
import 'package:legal_app/pages/wrapper.dart';

class CaseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: (Scaffold(
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
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 50.0, bottom: 80.0, left: 30.0, right: 30.0),
              child: Text(
                'Describe your case',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Provide a brief overview of your case here.'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Container(
                width: 150,
                child: RaisedButton(
                  onPressed: () {
                    //upload details
                    Navigator.pushNamed(context, 'page_wrapper');
                    //Navigator.of(context).pushNamed('home_menu');
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

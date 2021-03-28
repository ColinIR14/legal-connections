import 'package:flutter/material.dart';
import 'package:legal_app/pages/wrapper.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';

class CaseDetails extends StatefulWidget {
  final String category;
  CaseDetails({Key key, @required this.category}) : super(key: key);

  @override
  _CaseDetailsState createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {
  DatabaseMethods dbMethods = new DatabaseMethods();
  AuthService auth = new AuthService();
  final _form_key1 = GlobalKey<FormState>();
  String content = '';

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
                        child: Form(
                          key: _form_key1,
                          child: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                'Provide a brief overview of your case here.'),
                                validator: (val) => val.isEmpty ? 'Enter Title' : null,
                          onChanged: (val) {
                            setState(() => content = val);
                          }
                          ),)

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

                    Map<String, dynamic> caseMap = {
                      'content': content,
                      'category': widget.category,
                      'user': auth.getCurrEmail(),
                      'photos': ['https://expertphotography.com/wp-content/uploads/2011/05/photography-books.jpg',
                        'https://expertphotography.com/wp-content/uploads/2011/05/photography-books.jpg']
                    };
                    dbMethods.uploadCase(caseMap);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageWrapper()));
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

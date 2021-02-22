import 'package:flutter/material.dart';
import 'package:legal_app/pages/case_profile.dart';
import 'users.dart';

class CaseCard extends StatelessWidget {
  Client client;

  CaseCard(Client client) {
    this.client = client;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100], width: 2.0),
          bottom: BorderSide(color: Colors.grey[100], width: 2.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(client.profile_pic),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image.network(client.profile_pic)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${client.name}',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    '${client.location}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
              child: Text(
            '${client.cases[0][0]}', //needs to be changed. may not be first case
            style: TextStyle(
              fontSize: 20.0,
            ),
          )),
          Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                '${client.cases[0][1]}', //also needs to be changed. same reason
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade,
                maxLines: 4,
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CaseProfile(client)));
              },
              child: Text(
                'View Profile',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.lightBlue[700],
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollCases extends StatelessWidget {
  List<CaseCard> cases;

  ScrollCases(List<CaseCard> cases) {
    this.cases = cases;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cases,
      scrollDirection: Axis.vertical,
    );
  }
}

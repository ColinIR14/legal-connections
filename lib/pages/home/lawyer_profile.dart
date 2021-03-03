import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';

class LawyerProfile extends StatelessWidget {
  Lawyer lawyer;

  LawyerProfile(Lawyer lawyer) {
    this.lawyer = lawyer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(lawyer.profile_pic),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Image.network(lawyer.profile_pic)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text(
                              '${lawyer.name}',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.lightBlue[700],
                          )
                        ],
                      ),
                      Text(
                        '${lawyer.location}',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _generate_row(),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: 370,
                child: Text(
                  this.lawyer.bio,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _generate_row() {
    List<Widget> rows = [];
    var length = this.lawyer.categories.length;

    for (var i = 0; i < length; i += 2) {
      if (i == length - 1) {
        rows.add(Container(
          margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          decoration: BoxDecoration(
              color: Colors.lightBlue[700],
              border: Border.all(
                color: Colors.lightBlue[700],
              ),
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Text(
            '${this.lawyer.categories[i]}',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ));
      } else {
        rows.add(Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.lightBlue[700],
                  border: Border.all(
                    color: Colors.lightBlue[700],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Text(
                '${this.lawyer.categories[i]}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.lightBlue[700],
                  border: Border.all(
                    color: Colors.lightBlue[700],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Text(
                '${this.lawyer.categories[i + 1]}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ));
      }
    }

    return rows;
  }
}

import 'package:flutter/material.dart';
import 'classes/scroll_menu.dart';

class CasesMenu extends StatelessWidget {
  List<CaseCard> cases;

  CasesMenu(List<CaseCard> cases) {
    this.cases = cases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cases',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[100],
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: ScrollCases(cases),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey[100], width: 4.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            color: Colors.lightBlue[700],
          ),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                ),
                label: 'My Links'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: 'Messages'),
          ],
        ),
      ),
    );
  }
}

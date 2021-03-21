import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:legal_app/pages/classes/appbars.dart';
import 'package:legal_app/pages/home/cases_menu.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';
import "classes/users.dart";
import "classes/scroll_menu.dart";
import 'authenticate/register_screen.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'classes/post_card.dart';
import 'package:legal_app/pages/home/my_links.dart';

Client user1 = Client(
  'Billy Bobby',
  'Toronto',
  'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
  [
    [
      'Category',
      'jhkgjhkgfdsjhkgfsdjhkgfsdjhlkgfsdjhklgfsdhjlkgfjhlkfgsdgjhkjlhfkgjhkfsgdljkhgsfdkjhgsfjkhgfsjhgksfdjkhslgfjhkgfhjgkfsfhjgkdjslhgfkdjfgshdkljfkdsghsjdkfghskljdfhglskjdfghlskdjfghsdklfjgfskdjhsgkjghjksdflghsjkdfhgkjsdfhkdjshgskjdfhgksjdfhgjskdfhgskjldfghksjldfhgskjdfhgskjldfhgksljdfghsjkldfhgskldjfghjkdfhgskdlfhglsdfjkgshldjfkgh'
    ]
  ],
  [],
  [
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
  ],
);

CaseCard temp_case = CaseCard(user1);

CasesMenu temp_menu = CasesMenu([
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case
]);

PostCard temp_postcard = PostCard(
    user1,
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

HomeMenu temp_home = HomeMenu([temp_postcard, temp_postcard]);

MessageCard temp_msg = MessageCard(
    user1, 'this is to test overflow of text so it needs to be long ');

List<MessageCard> temp_messages = [
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg,
  temp_msg
];

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<OurUser>(context);
    if (user == null) {
      return InitScreen();
    } else {
      return temp_home;
    }
  }
}

class PageWrapper extends StatefulWidget {
  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  int _current_page = 0;
  static AuthService _auth = AuthService();

  final List<Widget> _pages = [
    temp_home,
    MyLinksPage(temp_messages),
  ];
  final List<String> _titles = ['Home', 'My Links'];

  final List<Widget> _app_bars = [
    AuthAppBar(_auth, 'Home'),
    DefaultAppbar('My Links')
  ];

  // If Appbar needs to change(like some should show logout/settings icon) then add a
  // list of Appbars here and set the Appbar based on page.

  void onTabTapped(int index) {
    setState(() {
      _current_page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _app_bars[_current_page],
        body: _pages[_current_page],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[100], width: 4.0))),
            child: BottomNavigationBar(
                currentIndex: _current_page,
                onTap: onTabTapped,
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
                ])));
  }
}

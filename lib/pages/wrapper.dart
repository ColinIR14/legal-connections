import "package:flutter/material.dart";
import 'package:legal_app/pages/authenticate/edit_profile.dart';
import 'package:legal_app/pages/authenticate/legal_selection.dart';
import 'package:legal_app/pages/classes/appbars.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/constants.dart';
import 'package:legal_app/services/database.dart';
import "classes/users.dart";
import "classes/scroll_menu.dart";
import 'authenticate/register_screen.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'classes/post_card.dart';
import 'package:legal_app/pages/home/my_links.dart';





class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<OurUser>(context);
    if (user == null) {
      return InitScreen();
    } else {
      return PageWrapper();
    }
  }
}

class PageWrapper extends StatefulWidget {
  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> { //loads in chats
  int _current_page = 0;
  static AuthService _auth = AuthService();
  Stream chats;
  DatabaseMethods dbMethods = new DatabaseMethods();
  OurUser user;
  List<OurUser> otherUsers;

  Widget chatsList() {
    return FutureBuilder(
      future: generateChats(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is List<MessageCard>) {
            return MyLinksPage(snapshot.data);
          }
        }
        return Container();
      },
    );
  }

  generateChats() async { //creates messagecard objects for each chatroom
    List messages = await giveMessagesUserObjects();
    List<MessageCard> messageCards = new List(messages.length);
    for (var i = 0; i < messages.length; i++) {
      messageCards[i] = MessageCard(
          messages[i]['chatNames'].toString()
              .replaceAll("_", "")
              .replaceAll(Constants.currUser.name, ""),
          messages[i]['otheruser'],
          '');
    }
    return messageCards;
  }

  giveMessagesUserObjects() async { //loads user objects for chats
    var chats = await dbMethods.getUserChats(_auth.getCurrEmail());

    for (int i = 0; i < chats.length; i++) {
      String otherEmail = chats[i]['chatID'].toString()
          .replaceAll("_", "")
          .replaceAll(_auth.getCurrEmail(), "");
      chats[i]['otheruser'] = await dbMethods.getOurUserbyEmail(otherEmail);
    }
    return chats;
  }




  getChatsFromUser() async { //loads chats for a certain user
    print("getting chats");
    user = await _auth.getOurUserbyEmail(_auth.getCurrEmail());
    var snapshots = await DatabaseMethods().getUserChats(user.email);
    List lst = snapshots.docs.toList();
    otherUsers = new List();
    for (int i = 0; i < otherUsers.length; i++) {
      String otherEmail = lst[i].data()['chatID'].toString()
          .replaceAll("_", "")
          .replaceAll(_auth.getCurrEmail(), "");
      print('Other email: $otherEmail');
      OurUser other = await _auth.getOurUserbyEmail(otherEmail);
      otherUsers.add(other);
    }


    await snapshots.forEach((doc) async {
      String otherEmail = doc.data()['chatID'].toString()
        .replaceAll("_", "")
        .replaceAll(_auth.getCurrEmail(), "");
        print('Other email: $otherEmail');
    OurUser other = await _auth.getOurUserbyEmail(otherEmail);
    otherUsers.add(other);
    });
    return snapshots;

  }

  final List<Widget> _app_bars = [
    null,
    DefaultAppbar('My Links'), DefaultAppbar('Notifications'), DefaultAppbar('Profile'), DefaultAppbar('Cases')
  ];

  // If Appbar needs to change(like some should show logout/settings icon) then add a
  // list of Appbars here and set the Appbar based on page.

  void onTabTapped(int index) {
    setState(() {
      _current_page = index;
    });
  }

  FutureBuilder generate_home() { //waits for and loads posts
    return FutureBuilder(
      future: generatePosts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot2) {
        if (!snapshot2.hasData) {
          return Container();
        } else {
            if (snapshot2.data is List<PostCard>) {
              List postCards = snapshot2.data;
              return HomeMenu(postCards);
            }
          return Container();

        }
      },
    );
  }

  generatePosts() async { //turns each post into postcard object
    List posts = await givePostsUserObjects();
    List<PostCard> postCards = new List(posts.length);
    for (var i = 0; i < posts.length; i++) {
      postCards[i] = PostCard(
          posts[i]['user'],
          posts[i]['picture'],
          posts[i]['message'],
          DateTime.now(),
          [],
          3);

    }
    return postCards;
  }

  givePostsUserObjects() async { //finds user for each post
    var posts = await dbMethods.getPosts();
    for (int i = 0; i < posts.length; i++) {
      posts[i]['user'] = await dbMethods.getOurUserbyEmail(posts[i]['user']);
    }
    return posts;
  }

  FutureBuilder generateCases() { //waits for cases to load and loads them
    return FutureBuilder(
      future: loadCases(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot3) {
        if (!snapshot3.hasData) {
          return Container();
        } else {
          if (snapshot3.data is List<CaseCard>) {
            List caseCards = snapshot3.data;
            return ScrollCases(caseCards);
          }
          return Container();
        }
      },
    );
  }

  loadCases() async { // turns each doc from database into actual case card
    List cases = await giveCasesUserObjects();
    List<CaseCard> caseCards = new List(cases.length);
    for (var i = 0; i < cases.length; i++) {


      caseCards[i] = CaseCard(
          cases[i]['user'],
          cases[i]['category'],
          cases[i]['content'],
          List<String>.from(cases[i]['photos']));

    }
    return caseCards;
  }

  giveCasesUserObjects() async { //loads cases and finds the user object for each case
    var cases = await dbMethods.getCases(Constants.currUser);

    for (int i = 0; i < cases.length; i++) {
      cases[i]['user'] = await dbMethods.getOurUserbyEmail(cases[i]['user']);
    }
    return cases;
  }

  @override
  Widget build(BuildContext context) {
    _auth.getOurUserWithData().then((value) {
    });

    return Scaffold(
        appBar: _current_page == 0 ? AuthAppBar(_auth, 'Home', context) : _app_bars[_current_page],
        body: [generate_home(), chatsList(), null, Profile(), generateCases()][_current_page],
        floatingActionButton: [0, 4].contains(_current_page) ? FloatingActionButton(
            elevation: 10.0,
            child: Icon(Icons.add),
            onPressed: (){
              if (_current_page == 4) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp()));
              } else {
                Navigator.pushNamed(context, 'create_post');
              }
            }
        ) : null,

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
                    // label: user.name,
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
                        Icons.account_circle,
                      ),
                      label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.account_balance_wallet,
                      ),
                      label: 'Cases'),
                ])));
  }
  signOut() {
    Navigator.pushNamedAndRemoveUntil(context, "register_screen", (Route<dynamic> route) => false);
  }


}



import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:legal_app/pages/authenticate/edit_profile.dart';
import 'package:legal_app/pages/authenticate/legal_selection.dart';
import 'package:legal_app/pages/classes/appbars.dart';
import 'package:legal_app/pages/home/cases_menu.dart';
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

//CaseCard temp_case = CaseCard(user1);
//CaseCard temp_case2 = CaseCard(user2);
/*
CasesMenu temp_menu = CasesMenu([
  temp_case2,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case
]);
*/
PostCard temp_postcard = PostCard(
    user1,
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

PostCard temp_postcard2 = PostCard(
    user2,
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

Map<String, String> userInfoMap = {
  "email": 'bob@bob.com',
  "name": 'bob',
  "type": 'Lawyer'
};

OurUser user2 = OurUser.fromData(userInfoMap);

HomeMenu temp_home = HomeMenu([temp_postcard2, temp_postcard]);

MessageCard temp_msg = MessageCard(
    user1.name, user1, 'this is to test overflow of text so it needs to be long ');

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
  Stream chats;
  DatabaseMethods dbMethods = new DatabaseMethods();
  OurUser user;
  List<OurUser> otherUsers;

  Widget chatsList() {
    /*
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        print(snapshot.hasData ? "Length ${snapshot.data.docs.length}": null);
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return MessageCard(
                  snapshot.data.docs[i].data()['chatNames'].toString()
                      .replaceAll("_", "")
                      .replaceAll(Constants.currUser.name, ""),
                  otherUsers[i],
                ''
              );
            })
            : Container();
      },
    );*/
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

  generateChats() async {
    List messages = await giveMessagesUserObjects();
    List<MessageCard> messageCards = new List(messages.length);
    for (var i = 0; i < messages.length; i++) {
      //print('Postpic: ${posts[i]['picture']}');
      //print('Postmessage: ${posts[i]['message']}');
      //print('Postuser: ${posts[i]['user']}');

      messageCards[i] = MessageCard(
          messages[i]['chatNames'].toString()
              .replaceAll("_", "")
              .replaceAll(Constants.currUser.name, ""),
          messages[i]['otheruser'],
          '');
    }
    //print(posts.length);
    return messageCards;
  }

  giveMessagesUserObjects() async {
    var chats = await dbMethods.getUserChats(_auth.getCurrEmail());
    //print(posts.length);
    //OurUser user = await dbMethods.getOurUserbyEmail('l@l.com');
    //OurUser user = await dbMethods.getOurUserbyEmail('f@f.com');
    //print("Specialties");
    //var data = await dbMethods.getLawyerSpecialties('l@l.com');
    //print(data.data()['specialties']);
    //List<String> cats = new List<String>.from(data.data()['specialties']);
    //user.categories = cats;
    //print(user);
    //print(user.email);
    //print(user.categories);

    for (int i = 0; i < chats.length; i++) {
      //print('Userstring: ${posts[i]['user']}');
      String otherEmail = chats[i]['chatID'].toString()
          .replaceAll("_", "")
          .replaceAll(_auth.getCurrEmail(), "");
      chats[i]['otheruser'] = await dbMethods.getOurUserbyEmail(otherEmail);
      //print("POST: ");
      //print(posts[i]['user']);
    }
    return chats;
  }




  getChatsFromUser() async {
    print("getting chats");
    user = await _auth.getOurUserbyEmail(_auth.getCurrEmail());
    var snapshots = await DatabaseMethods().getUserChats(user.email);
    List lst = snapshots.docs.toList();
    otherUsers = new List();
    int j = 0;
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
    j++;
    });
    return snapshots;

    /*

    for (int i = 0; i < snapshots.data.docs.length; i++) {
      String otherEmail = snapshots.data.docs[i].data()['chatID'].toString()
          .replaceAll("_", "")
          .replaceAll(_auth.getCurrEmail(), "");
      print('Other email: $otherEmail');
      OurUser other = await _auth.getOurUserbyEmail(otherEmail);
      otherUsers.add(other);
    }
    setState(() {
      chats = snapshots;
    });
     */

    /*
    DatabaseMethods().getUserChats(user.email).then((snapshots) {
      setState(() {
        for (int i=0; i<snapshots.data.docs.length; i++) {
          snapshots.data.docs[i].data()['otherUser'] = await _auth.getOurUserbyEmail(snapshots.data.docs[i].data()['chatID'].toString()
              .replaceAll("_", "")
              .replaceAll(_auth.getCurrEmail(), ""));
        }
        chats = snapshots;
        print(
            "chats: ${chats.toString()} user:  ${Constants.currUser.name}");
      });
    });
     */
  }



  final List<Widget> _pages = [
    temp_home,
    MyLinksPage(temp_messages), null, null
  ];
  final List<String> _titles = ['Home', 'My Links', 'Notifications', 'Profile', 'Cases'];

  final List<Widget> _app_bars = [
    null,
    DefaultAppbar('My Links'), DefaultAppbar('Notifications'), DefaultAppbar('Profile'), DefaultAppbar('Cases')
  ];

  // If Appbar needs to change(like some should show logout/settings icon) then add a
  // list of Appbars here and set the Appbar based on page.

  void onTabTapped(int index) {
    //print(Constants.currUser.email);
    //print("hi");
    //_auth.getOurUserWithData().then((value) {
      //print("here");
      //print(value.name);
      //print(value.email);
    //});
    setState(() {
      _current_page = index;
    });
  }

  // get_posts() async {
  //   Future<List> future = _database.getPosts();
  //   List temp = await future;
  //   return temp;
  // }

  // generate_post_cards() async {
  //   List temp = await _database.getPosts();
  //   for (var i = 0; i < temp.length; i++) {
  //     print(posts[i]);
  //   }
  // }
  FutureBuilder generate_home() {
    return FutureBuilder(
      future: generatePosts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot2) {
        if (!snapshot2.hasData) {
          //print(snapshot);
          //print("No data in snapshot");
          return Container();
        } else {
            if (snapshot2.data is List<PostCard>) {
              List postCards = snapshot2.data;
              return HomeMenu(postCards);
            }
          //print("Snapshot has data");
          /*
          List posts_data = snapshot.data;
          List post_cards;

          for (var i = 0; i < posts_data.length; i++) {
            post_cards.add(PostCard(
                posts_data[i]['user'],
                posts_data[i]['picture'],
                posts_data[i]['message'],
                DateTime.now(),
                [],
                3));
          }

           */
          return Container();

        }
      },
    );
  }

  generatePosts() async {
    List posts = await givePostsUserObjects();
    List<PostCard> postCards = new List(posts.length);
    for (var i = 0; i < posts.length; i++) {
      //print('Postpic: ${posts[i]['picture']}');
      //print('Postmessage: ${posts[i]['message']}');
      //print('Postuser: ${posts[i]['user']}');

      postCards[i] = PostCard(
          posts[i]['user'],
          posts[i]['picture'],
          posts[i]['message'],
          DateTime.now(),
          [],
          3);

    }
    //print(posts.length);
    return postCards;
  }

  givePostsUserObjects() async {
    var posts = await dbMethods.getPosts();
    //print(posts.length);
    OurUser user = await dbMethods.getOurUserbyEmail('l@l.com');
    //OurUser user = await dbMethods.getOurUserbyEmail('f@f.com');
    //print("Specialties");
    var data = await dbMethods.getLawyerSpecialties('l@l.com');
    //print(data.data()['specialties']);
    List<String> cats = new List<String>.from(data.data()['specialties']);
    //user.categories = cats;
    //print(user);
    //print(user.email);
    //print(user.categories);

    for (int i = 0; i < posts.length; i++) {
      //print('Userstring: ${posts[i]['user']}');
      posts[i]['user'] = await dbMethods.getOurUserbyEmail(posts[i]['user']);
      //print("POST: ");
      //print(posts[i]['user']);
    }
    return posts;
  }

  FutureBuilder generateCases() {
    return FutureBuilder(
      future: loadCases(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot3) {
        if (!snapshot3.hasData) {
          //print(snapshot);
          //print("No data in snapshot");
          return Container();
        } else {
          if (snapshot3.data is List<CaseCard>) {
            List caseCards = snapshot3.data;
            return ScrollCases(caseCards);
          }
          //print("Snapshot has data");
          return Container();
        }
      },
    );
  }

  loadCases() async {
    List cases = await giveCasesUserObjects();
    List<CaseCard> caseCards = new List(cases.length);
    for (var i = 0; i < cases.length; i++) {


      caseCards[i] = CaseCard(
          cases[i]['user'],
          cases[i]['category'],
          cases[i]['content'],
          List<String>.from(cases[i]['photos']));

    }
    //print(posts.length);
    return caseCards;
  }

  giveCasesUserObjects() async {
    var cases = await dbMethods.getCases(Constants.currUser);

    for (int i = 0; i < cases.length; i++) {
      cases[i]['user'] = await dbMethods.getOurUserbyEmail(cases[i]['user']);
    }
    return cases;
  }

  @override
  Widget build(BuildContext context) {
    _auth.getOurUserWithData().then((value) {
      //print('here');
      //print(value.name);
      //print(value.email);
    });

    return Scaffold(
        appBar: _current_page == 0 ? AuthAppBar(_auth, 'Home', context) : _app_bars[_current_page],
        // body: _pages[_current_page],
        //body: _current_page == 0 ? generate_home() :_pages[_current_page],
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
                //print('Add post');
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



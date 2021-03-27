import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
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

CaseCard temp_case = CaseCard(user1);
CaseCard temp_case2 = CaseCard(user2);

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
    user1.name, user1.email, 'this is to test overflow of text so it needs to be long ');

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

  Widget chatsList() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MessageCard(
                  snapshot.data.documents[index].data['chatNames'].toString()
                      .replaceAll("_", "")
                      .replaceAll(Constants.currUser.name, ""),
                snapshot.data.documents[index].data['chatID'].toString()
                    .replaceAll("_", "")
                    .replaceAll(Constants.currUser.email, ""),
                ''
              );
            })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getChatsFromUser();
    super.initState();
  }

  getChatsFromUser() async {
    DatabaseMethods().getUserChats(Constants.currUser.email).then((snapshots) {
      setState(() {
        chats = snapshots;
        print(
            "chats: ${chats.toString()} user:  ${Constants.currUser.name}");
      });
    });
  }



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
    //print(Constants.currUser.email);
    //print("hi");
    _auth.getOurUserWithData().then((value) {
      //print("here");
      //print(value.name);
      //print(value.email);
    });
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
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          print(snapshot);
          print("No data in snapshot");
          return Container();
        } else {
          print("Snapshot has data");
          List postCards = snapshot.data;
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
          return HomeMenu(postCards);
        }
      },
    );
  }

  generatePosts() async {
    List posts = await givePostsUserObjects();
    List<PostCard> postCards = new List(posts.length);
    for (var i = 0; i < posts.length; i++) {
      print('Postpic: ${posts[i]['picture']}');
      print('Postmessage: ${posts[i]['message']}');
      print('Postuser: ${posts[i]['user']}');

      postCards[i] = PostCard(
          posts[i]['user'],
          posts[i]['picture'],
          posts[i]['message'],
          DateTime.now(),
          [],
          3);

    }
    print(posts.length);
    return postCards;
  }

  givePostsUserObjects() async {
    var posts = await dbMethods.getPosts();
    print(posts.length);
    OurUser user = await dbMethods.getOurUserbyEmail('l@l.com');
    //OurUser user = await dbMethods.getOurUserbyEmail('f@f.com');
    print("Specialties");
    var data = await dbMethods.getLawyerSpecialties('l@l.com');
    print(data.data()['specialties']);
    List<String> cats = new List<String>.from(data.data()['specialties']);
    //user.categories = cats;
    print(user);
    print(user.email);
    print(user.categories);

    for (int i = 0; i < posts.length; i++) {
      print('Userstring: ${posts[i]['user']}');
      posts[i]['user'] = await dbMethods.getOurUserbyEmail(posts[i]['user']);
      print("POST: ");
      print(posts[i]['user']);
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    _auth.getOurUserWithData().then((value) {
      //print('here');
      //print(value.name);
      //print(value.email);
    });

    return Scaffold(
        appBar: _app_bars[_current_page],
        // body: _pages[_current_page],
        body: _current_page == 0 ? generate_home() :_pages[_current_page],
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: Icon(Icons.add),
            onPressed: (){
              print('Add post');
              Navigator.pushNamed(context, 'create_post');
            }
        ),

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
                        Icons.message,
                      ),
                      label: 'Messages'),
                ])));
  }
  signOut() {
    Navigator.pushNamedAndRemoveUntil(context, "register_screen", (Route<dynamic> route) => false);
  }


}



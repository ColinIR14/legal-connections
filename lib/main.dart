import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/post_card.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/home_page.dart';
import 'pages/authenticate/register_screen.dart';
import 'pages/home/cases_menu.dart';
import 'pages/classes/scroll_menu.dart';
import 'pages/home/case_profile.dart';
import 'pages/authenticate/signup_page.dart';
import 'pages/wrapper.dart';
import 'pages/authenticate/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

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
  [
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
  ],
);

Post temp_post = Post(
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

PostCard temp_postcard = PostCard(user1, temp_post);

HomeMenu temp_home = HomeMenu([temp_postcard, temp_postcard]);

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

CaseProfile temp_profile = CaseProfile(user1);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'wrapper',
    routes: {
      'wrapper': (context) => Wrapper(),
      'sign_up': (context) => SignupForm(),
      'register_screen': (context) => InitScreen(),
      'case_profile': (context) => temp_profile,
      'cases_menu': (context) => temp_menu,
      'login': (context) => LoginForm(),
      'home_menu': (context) => temp_home
    },
  ));
}

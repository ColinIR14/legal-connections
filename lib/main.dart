import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/post_card.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/home_page.dart';
import 'package:legal_app/pages/home/lawyer_profile.dart';
import 'pages/authenticate/register_screen.dart';
import 'pages/home/cases_menu.dart';
import 'pages/classes/scroll_menu.dart';
import 'pages/home/case_profile.dart';
import 'pages/authenticate/signup_page.dart';
import 'pages/wrapper.dart';
import 'pages/authenticate/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

Lawyer lawyer1 = Lawyer(
    'Lawyer 1',
    'Toronto',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    [],
    ['Category1', 'category 2', 'category 3'],
    [
      'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png'
    ],
    "im lawyer 1. hi im lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hiim lawyer 1. hi");

Client client1 = Client(
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

Post temp_post = Post(
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

PostCard temp_postcard = PostCard(lawyer1, temp_post);

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

LawyerProfile temp_lawyer_profile = LawyerProfile(lawyer1);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<OurUser>.value(
      value: AuthService().user,
      child: MaterialApp(
    initialRoute: 'wrapper',
    // initialRoute: 'home_menu',
    routes: {
      'wrapper': (context) => Wrapper(),
      'sign_up': (context) => SignupForm(),
      'register_screen': (context) => InitScreen(),
      'temp_case_profile': (context) => temp_profile,
      'cases_menu': (context) => temp_menu,
      'login': (context) => LoginForm(),
      'home_menu': (context) => temp_home,
      'temp_lawyer_profile': (context) => temp_lawyer_profile,
    },
  )));
}

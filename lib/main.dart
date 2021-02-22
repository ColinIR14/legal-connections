import 'package:flutter/material.dart';
import 'package:legal_app/pages/case_profile.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/register_screen.dart';
import 'pages/cases_menu.dart';
import 'pages/classes/scroll_menu.dart';
import 'pages/case_profile.dart';
import 'pages/signup_page.dart';

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
void main() {
  runApp(MaterialApp(
    initialRoute: 'sign_up',
    routes: {
      'sign_up': (context) => SignupForm(),
      'register_screen': (context) => InitScreen(),
      'case_profile': (context) => temp_profile,
      'cases_menu': (context) => temp_menu,
    },
  ));
}

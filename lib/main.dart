import 'package:flutter/material.dart';
import 'package:legal_app/pages/classes/users.dart';
import 'package:legal_app/pages/home/create_post.dart';
import 'pages/authenticate/register_screen.dart';
import 'pages/authenticate/signup_page.dart';
import 'pages/wrapper.dart';
import 'pages/authenticate/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<OurUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        //initialRoute: 'cases_menu',
        initialRoute: 'register_screen',
        routes: {
          'wrapper': (context) => Wrapper(),
          'sign_up': (context) => SignupForm(),
          'register_screen': (context) => InitScreen(),
          'login': (context) => LoginForm(),
          'page_wrapper': (context) => PageWrapper(), //change
          'create_post': (context) => CreatePost()
        },
      )));
}

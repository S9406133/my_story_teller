import 'package:flutter/material.dart';
import 'package:my_story_teller/screens/child_home.dart';
import 'package:my_story_teller/screens/login.dart';
import 'package:my_story_teller/screens/profile_nav.dart';
import 'package:my_story_teller/screens/registration.dart';
import 'package:my_story_teller/screens/splash.dart';
import 'package:my_story_teller/screens/book_view.dart';
import 'package:my_story_teller/screens/book_descr.dart';
import 'package:my_story_teller/screens/book_recording.dart';
import 'package:my_story_teller/screens/recording_view.dart';
import 'package:my_story_teller/elements/nav_bar.dart';

void main() {
  runApp(MaterialApp(
    title: 'My Story Teller',
    debugShowCheckedModeBanner: false,

    // Route map for Navigator
    // Screens that have bottom nav must be routed to BottomNav with
    // the index of the bottom nav button
    // Add routes as screens created
    routes: {
      '/': (context) => const SplashScr(),                ///Splash COMPLETED
      '/login': (context) => const Login(),               ///Login COMPLETED
      '/pNav': (context) => const ProfileNav(),           ///Profile Navigation COMPLETED
      '/regis': (context) => const Registration(),        ///User Registration COMPLETED
      '/cHome': (context) => const ChildHome(),           ///Child Home COMPLETED
      '/pHome': (context) => const BottomNav(index: 0),   ///Parent HOME COMPLETED
      '/addProf': (context) => const BottomNav(index: 1), ///Update Profiles COMPLETED
      '/search': (context) => const BottomNav(index: 2),  ///Search Screen COMPLETED
      '/saved': (context) => const BottomNav(index: 3),   ///Saved Books COMPLETED
      '/settings': (context) => const BottomNav(index: 4),///Settings not an MVF
      '/book': (context) => const BookView(),             ///Book View COMPLETED
      '/bookDescr': (context) => const BookDescr(),       ///Book Description COMPLETED
      '/recView': (context) => const RecordingView(),     ///Recording View COMPLETED
      '/bookRec': (context) => const BookRecording(),     ///Book Recording COMPLETED
    },
  )
  );
}

/* Colors */
Color a = Color(0xFFADC178);
var a2 = Colors.lightGreen[300];

Color b = Color(0xFF4ECDC4);
var b2 = Colors.teal[300];

Color c = Color(0xFF293241);
var c2 = Colors.blueGrey[800];



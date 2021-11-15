import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/data/book.dart';

/* Splash screen - Route: '/' */

class SplashScr extends StatefulWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {

  @override
  void initState() {   // Adds test profiles and book data to the test user
    addTestProfiles();
    setBookData();
    saveTestBooks();
    //addTestRecordings();
    delay();
    super.initState();
  }

  void delay(){
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.popAndPushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          /* Image box */
          Container(
            margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Image.asset('assets/Splash.jpg'),
          ),
          const SizedBox(height: 10),
          /* Heading */
          const Text('MY STORY TELLER',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 50.0),

          // ElevatedButton(        // Login button
          //   onPressed: () {
          //   Navigator.pushNamed(context, '/login');
          //   },
          //   child: const Text('LOG IN',
          //     style: TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          //   style: ButtonStyle(
          //     //backgroundColor: MaterialStateProperty.all(buttonColor),
          //     padding: MaterialStateProperty.all(
          //         const EdgeInsets.fromLTRB(38, 10, 38, 10)),
          //   ),
          // ),
        ],
      ),
    );
  }
}

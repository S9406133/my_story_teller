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
  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  @override
  void initState() {   // Adds test profiles to the test user
    addTestProfiles();
    setTestPages();
    saveTestBooks();
    addTestRecordings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
      body: Center(
        child: Column(
          children: <Widget>[
            /* Image box */
            Container(
              margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              padding: const EdgeInsets.all(10),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: bgColor,
                  width: 10,
                ),
              ),
              //child: Image.network('https://www.scholastic.com/content/parents/en/books-and-reading/raise-a-reader-blog/make-reading-fun-these-3-easy-tips/_jcr_content.img.600.high.png'),
              child: Image.asset('assets/ReadingImage.jpg'),
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
            /* Buttons */
            ElevatedButton(                   // Login button
              onPressed: () {
              Navigator.pushNamed(context, '/login');
              },
              child: const Text('LOG IN',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(38, 10, 38, 10)),
              ),
            ),

            // const SizedBox(height: 30.0),
            // const Text('New User?',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 22,
            //   ),
            // ),
            //
            // ElevatedButton(                         // Sign up button
            //   onPressed: () {print('Splash-SignUp');
            //   Navigator.pushNamed(context, '/regis');},
            //   child: const Text('SIGN UP',
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(buttonColor),
            //     padding: MaterialStateProperty.all(
            //         const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/dialog_box.dart';

/* Login screen - Route '/login' */

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;
  // Variables to hold entered text
  String username = ' ', password = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15.0),
                /* Heading */
                const Text('MY STORY TELLER',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 10.0),

                /* Image */
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  padding: const EdgeInsets.all(10),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: bgColor,
                      width: 10,
                    ),
                  ),
                  //child: Image.network('https://www.scholastic.com/content/parents/en/books-and-reading/raise-a-reader-blog/make-reading-fun-these-3-easy-tips/_jcr_content.img.600.high.png'),
                  child: FittedBox(
                    child: Image.asset('assets/ReadingImage.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),

                /* Username text field */
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: 300,
                  child: TextField(
                    onChanged: (text) {
                      username = text;
                    },
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      hintText: 'Email - tom@mail.com',
                      filled: true,
                      fillColor: bgColor[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                /* Password text field */
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: 300,
                  child: TextField(
                    onChanged: (text) {
                      password = text;
                    },
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      hintText: 'Password - 1234',
                      filled: true,
                      fillColor: bgColor[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                /* Bottom Buttons */
                ElevatedButton(             // Login button
                  onPressed: () {
                    // Checks if text entered matches a user
                    bool success = setCurrentUser(username, password);
                    if (success == true) {
                      Navigator.popAndPushNamed(context, '/pNav');
                    }else{
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => const MyDialog(
                              title: 'Incorrect Username or Password')
                      );
                    }
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
                const SizedBox(height: 30.0),

                const Text('New User?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),

                ElevatedButton(                     // Sign up button
                  onPressed: () {
                    Navigator.pushNamed(context, '/regis');
                  },
                  child: const Text('SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
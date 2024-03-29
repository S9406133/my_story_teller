import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/logout_button.dart';

/* Parent home screen - Route 'pHome' */

class ParentHome extends StatefulWidget {
  const ParentHome({Key? key}) : super(key: key);

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {

  final themeColor = Colors.blueGrey;

  final String _userName = users[currentUserIndex].currProfile.firstname +
      ' ' + users[currentUserIndex].currProfile.lastname;
  final String _userEmail = users[currentUserIndex].currProfile.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(
                context, "/pNav", (Route<dynamic> route) => false);
          },
        ),
        backgroundColor: themeColor[300],
        title: const Text('Home'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
        actions: const <Widget>[
          LogoutButton(),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                /* Avatar and User Heading */
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 20, 5),
                      child: CircleAvatar(
                        minRadius: 40,
                        child: Icon(
                          Icons.account_circle,
                          size: 80,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_userName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(_userEmail,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                /* Heading */

                const Text('Welcome to',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('MY STORY TELLER',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 15),

                /* Buttons */
                HomeScreenButton(title: 'Search Library', routeName: '/search'),
                const SizedBox(height: 15),
                HomeScreenButton(title: 'Update User Profiles', routeName: '/addProf'),
                const SizedBox(height: 15),
                HomeScreenButton(title: 'Create a Recording', routeName: '/saved'),
                const SizedBox(height: 15),
                HomeScreenButton(title: 'View Saved Books', routeName: '/saved'),
                const SizedBox(height: 15),
                HomeScreenButton(title: 'Update Settings', routeName: '/settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for buttons on Home screen
class HomeScreenButton extends StatelessWidget {

  final String title;
  final String routeName;
  final buttonColor = Colors.blueGrey[100];

  HomeScreenButton ({Key? key, required this.title, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);},
        child: Text(title,
          style: const TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
      ),
    );
  }
}

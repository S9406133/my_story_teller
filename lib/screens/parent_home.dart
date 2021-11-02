import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';

/* Parent home screen - Route 'pHome' */

class ParentHome extends StatefulWidget {
  const ParentHome({Key? key}) : super(key: key);

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.white24;

  final String userName = users[currentUserIndex].current.firstname +
      ' ' + users[currentUserIndex].current.lastname;
  final String userEmail = users[currentUserIndex].current.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
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
        backgroundColor: bgColor[300],
        title: const Text('Home - Parent'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
        actions: <Widget>[IconButton(
          icon: const Icon(Icons.logout, size: 30),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, "/login", (Route<dynamic> route) => false),
        ),
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
                        Text(userName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(userEmail,
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
  final buttonColor = Colors.white;

  HomeScreenButton ({Key? key, required this.title, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(  // Search Button
      width: 300,
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

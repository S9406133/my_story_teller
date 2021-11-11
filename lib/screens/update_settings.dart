import 'package:flutter/material.dart';
import 'package:my_story_teller/elements/logout_button.dart';

/* Allows user to make recording - Route: '/settings' */

class UpdateSettings extends StatelessWidget {
  const UpdateSettings({Key? key}) : super(key: key);

  final themeColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: themeColor[300],
        title: const Text('Update Settings'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
        actions: const <Widget>[
          LogoutButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(50),
        child: const Text('This is the update settings screen. '
            'It has not been created, sorry.',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }
}
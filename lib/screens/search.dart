import 'package:flutter/material.dart';

/* Search screen - Route '/search' */

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
      /* App Bar */
      appBar: AppBar(
        backgroundColor: bgColor[300],
        title: Text('Search'),
        titleTextStyle: TextStyle(
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
      //body:
      //TODO
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';

/* Shows a full description of a book - Route: '/bookDescr' */

class BookDescr extends StatelessWidget {
  BookDescr({Key? key}) : super(key: key);

  final Book _currentBook = users[currentUserIndex].savedBooks[currentBookIndex];

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor[100],
        /* App Bar */
        appBar: AppBar(
          backgroundColor: bgColor[300],
          title: const Text('Book Description'),
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
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: FittedBox(
                      child: Image.asset(_currentBook.image!),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(_currentBook.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(_currentBook.author,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                width: 340,
                height: 300,
                child: Text(_currentBook.longDesc!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              //TODO Add button
            ],
          ),
        )
    );
  }
}

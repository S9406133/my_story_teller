import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter_sound/flutter_sound.dart';

/* Allows user to make recording - Route: '/bookRec' */

class BookRecording extends StatefulWidget {
  const BookRecording({Key? key}) : super(key: key);

  @override
  State<BookRecording> createState() => _BookRecordingState();
}

class _BookRecordingState extends State<BookRecording> {
  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  final Book _currentBook = users[currentUserIndex].savedBooks[currentBookIndex];
  int _numPages = 0;

  @override
  void initState() {
    _numPages = _currentBook.pages.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor[100],
        /* App Bar */
        appBar: AppBar(
          backgroundColor: bgColor[300],
          title: const Text('Book Recording'),
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
          child: Center(
            child: Column(
                children: <Widget>[

                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    height: 38,
                    child: Text(_currentBook.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                    Expanded(
                      child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // border: Border(
                        //   top: BorderSide(),
                        // ),
                      ),
                      child: Swiper(
                        itemBuilder: (BuildContext context,int index){
                          return Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                  _currentBook.pages[index],
                                  fit: BoxFit.fill
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 20,
                            margin: const EdgeInsets.all(20),
                          );
                        },
                        itemCount: _numPages,
                        pagination: const SwiperPagination(
                          builder: SwiperPagination.fraction,
                          alignment: Alignment.topCenter,
                        ),
                        control: const SwiperControl(),
                        loop: false,
                      ),
                    ),
                  ),

                ]
            ),
          ),
        )
      //TODO
    );
  }
}

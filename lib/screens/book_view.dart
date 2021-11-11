import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:card_swiper/card_swiper.dart';

/* Book view screen - Route '/book' */

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final bgColor = Colors.teal;

  final SavedBook _currentBook = users[currentUserIndex].savedBooks[currentBookIndex];
  int _numPages = 0;
  bool _recAvail = false;

  @override
  void initState() {
    _numPages = _currentBook.pages!.length;
    // Sets the variable if recordings are available
    if (_currentBook.recordings.isNotEmpty){
      _recAvail = true;
    }else{
      _recAvail = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: bgColor[300],
        title: Text(_currentBook.title),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
      ),

      body:
      Stack(
        children: <Widget>[
                                // Swiper
          Swiper(
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                      _currentBook.pages![index],
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
              alignment: Alignment(0.0, -1.0),  // Doesn't Work???
            ),
            control: const SwiperControl(),
            loop: false,
          ),

          Positioned(         // View recordings button
            right: 10,
            bottom: 10,
            child: Visibility(    // Only displays if recordings are available
              visible: _recAvail,
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.pushNamed(context, '/recView'),
                label: const Text('Play Recording',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                icon: const Icon(Icons.play_arrow_rounded),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

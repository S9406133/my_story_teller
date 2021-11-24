import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/logout_button.dart';

import 'book_descr.dart';

/* Saved Books screen - Route: '/saved' */

class SavedBooks extends StatefulWidget {
  const SavedBooks({Key? key}) : super(key: key);

  @override
  State<SavedBooks> createState() => _SavedBooksState();
}

class _SavedBooksState extends State<SavedBooks> {

  final themeColor = Colors.blueGrey;
  final buttonColor = Colors.teal;
  var _bgColor = Colors.blueGrey[100];

  final List<SavedBook> _bookList = users[currentUserIndex].savedBooks;
  bool _bookSaved = false;

  @override
  void initState() {
    // Sets the values if there are saved books or not
    if (_bookList.isNotEmpty){
      _bookSaved = true;
      _bgColor = Colors.blueGrey[100];
    } else{
      _bookSaved = false;
      _bgColor = Colors.white;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: themeColor[300],
        title: const Text('Saved Books'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
        actions: const <Widget>[
          LogoutButton(),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[

            Visibility(   // Displays text and button if no books saved
              visible: !_bookSaved,
              child: Column(
                children: <Widget>[

                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text('No books currently saved. Please search '
                        'for books in the library to add them.',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(      // Search screen Button
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/search');},
                      child: const Text('Search Library',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(themeColor[100]),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            /* Story List */
            Visibility(
              visible: _bookSaved,
              child: Expanded(
                child: ListView.builder(
                  itemCount: _bookList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Card(

                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(    // Overall column
                            children: [

                              GestureDetector(  // Makes top row of card tappable
                                onTap: (){      // Displays Book Description
                                  print('${_bookList[index].image}');
                                  setSelectedBook(_bookList[index]);
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration: const Duration(seconds: 1),
                                          pageBuilder: (_, __, ___) => const BookDescr()
                                      ));
                                },
                                child: Row(          // Image and description row
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Container(    // Image Container
                                      height: 80,
                                      width: 80,
                                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Hero(
                                        tag: '${_bookList[index].image}',
                                        child: Image.asset('${_bookList[index].image}'),
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(       // Description column
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(_bookList[index].title,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(_bookList[index].description,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Row(        // Button row
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  TextButton.icon(    // Play button
                                    onPressed: (){
                                      setCurrentBook(index);
                                      Navigator.pushNamed(context, '/book');
                                    },
                                    label: const Text('Play',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    icon: const Icon(Icons.play_arrow_rounded,
                                        color: Colors.black
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          buttonColor[100]),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.fromLTRB(0, 0, 20, 0)),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(100,35)),
                                    ),
                                  ),

                                  const SizedBox(width: 50),

                                  TextButton.icon(    // Record button
                                    onPressed: (){
                                      setCurrentBook(index);
                                      Navigator.pushNamed(context, '/bookRec');
                                    },
                                    label: const Text('Record',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    icon: const Icon(Icons.fiber_manual_record,
                                      color: Colors.red,
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          buttonColor[100]),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(6)),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(100,35)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

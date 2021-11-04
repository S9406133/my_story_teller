import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/dialog_box.dart';

/* Shows a full description of a book - Route: '/bookDescr' */

class BookDescr extends StatefulWidget {
  BookDescr({Key? key}) : super(key: key);

  @override
  State<BookDescr> createState() => _BookDescrState();
}

class _BookDescrState extends State<BookDescr> {
  //final Book selectedBook = books[searchedBookIndex];
  bool _exists = false;
  bool _visible = true;

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.white;

  @override
  void initState() {
    _exists = users[currentUserIndex].bookExists(selectedBook.title);
    if (_exists == true) {
      _visible = false;
    }
    super.initState();
  }

  void setExists() {
    _exists = users[currentUserIndex].bookExists(selectedBook.title);
    if (_exists == true) {
      _visible = false;
    }else{
      _visible = true;
    }
  }

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

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),

            Row(
              children: <Widget>[
                SizedBox(
                  width: 150,
                  height: 150,
                  child: FittedBox(
                    child: Image.asset(selectedBook.image!),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(selectedBook.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(selectedBook.author,
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
              //height: 300,
              child: Text(selectedBook.longDesc!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: 340,
              //height: 300,
              child: Column(
                children: [
                  const Text('Categories:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 340,
                    height: 100,
                    child: ListView.builder(
                        itemCount: selectedBook.categories!.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(selectedBook.categories![index],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),

            Stack(
              //alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[

                Visibility(
                  visible: _exists,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: const Text('This book has been added',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  width: 300,
                  height: 50,
                  child: Visibility(
                    visible: _visible,
                    child: ElevatedButton(
                      onPressed: () {
                        bool _result = false;
                        _result = users[currentUserIndex].saveBook(selectedBook);
                        if (_result == true){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => MyDialog(
                                title: selectedBook.title +
                                    ' has been successfully added.'),
                          );
                        }
                        setState(() {
                          setExists();
                        });
                      },
                      child: const Text('Add book',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


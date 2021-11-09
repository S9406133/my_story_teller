import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/dialog_box.dart';

/* Shows a full description of a book - Route: '/bookDescr' */

class BookDescr extends StatefulWidget {
  const BookDescr({Key? key}) : super(key: key);

  @override
  State<BookDescr> createState() => _BookDescrState();
}

class _BookDescrState extends State<BookDescr> {

  final themeColor = Colors.blueGrey;

  // Holds the value if book already saved or not
  bool _exists = false;

  @override
  void initState() {
    // Sets exists variable
    _exists = users[currentUserIndex].bookExists(selectedBook.title);
    super.initState();
  }

  // Called when Add Book button pressed to update variables
  void setExists() {
    _exists = users[currentUserIndex].bookExists(selectedBook.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: themeColor[300],
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

                SizedBox(       // Book Image
                  width: 120,
                  height: 120,
                  child: FittedBox(
                    child: Image.asset(selectedBook.image!),
                  ),
                ),

                Expanded(
                  child: Column(         // Title and Author text
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(selectedBook.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(selectedBook.author,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(          // Long description text
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(selectedBook.longDesc!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Padding(          // Categories heading and list
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  const Text('Categories:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  Container(         // Categories List
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    height: 100,
                    child: ListView.builder(
                        itemCount: selectedBook.categories!.length,
                        itemBuilder: (context, index){
                          return Text(selectedBook.categories![index],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),

            Stack(        // Add book or text displayed
              children: <Widget>[

                Visibility(     // Text is displayed if book exists in saved books
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

                Visibility(    // Add book button displayed if book doesn't exist in saved books
                  visible: !_exists,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        bool _result = false;
                        _result = users[currentUserIndex].saveBook(selectedBook);
                        if (_result == true){
                          showDialog<String>(     // Success dialog
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
                        backgroundColor: MaterialStateProperty.all(themeColor[100]),
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


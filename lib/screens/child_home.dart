import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/dialog_box.dart';

/* Child home screen - Route '/cHome' */

class ChildHome extends StatefulWidget {
  const ChildHome({Key? key}) : super(key: key);

  @override
  State<ChildHome> createState() => _ChildHomeState();
}

class _ChildHomeState extends State<ChildHome> {

  final themeColor = Colors.teal;

  String _newText = '';
  final String _childName = users[currentUserIndex].current.firstname;
  final List<SavedBook> _bookList = users[currentUserIndex].savedBooks;

  bool _bookSaved = false;

  @override
  void initState() {
    // Sets the value if there are saved books or not
    if (_bookList.isNotEmpty){
      _bookSaved = true;
    } else{
      _bookSaved = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /* Heading */
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('MY STORY TELLER',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Text('Welcome $_childName',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Visibility(   // Displays text if no books saved
              visible: !_bookSaved,
              child: const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Text('Sorry, no books have been added yet.'
                      '\n\nPlease ask an adult to add books for you to view.',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),

            /* Story List */
            Visibility(     // Displays if a book has been saved
              visible: _bookSaved,
              child: Expanded(
                child: Container(   // Adds top and bottom border
                  decoration: BoxDecoration(
                    color: themeColor[100],
                    border: const Border(
                      top: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: _bookList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child: Card(
                          child: ListTile(
                            onTap: (){
                              setCurrentBook(index);
                              Navigator.pushNamed(context, '/book');
                            },
                            isThreeLine: true,
                            title: Text(_bookList[index].title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(_bookList[index].description,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  '${_bookList[index].image}'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            /* Exit Button */
            Container(
              margin: const EdgeInsets.all(30),
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                /* Exit dialog is shown requiring a password */
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Exit Child Home Screen',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    content: const Text('Please enter User Password to exit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    actions: <Widget>[

                      SizedBox(       // Password text field in dialog
                        width: 100,
                        child: TextField(
                          onChanged: (text) {
                            _newText = text;
                          },
                          obscureText: true,
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            hintText: '1234',
                            filled: true,
                            fillColor: themeColor[50],
                          ),
                        ),
                      ),

                      TextButton(           // Dialog OK Button
                        onPressed: () {
                          // Checks if password entered matches
                          if (users[currentUserIndex].password == _newText) {
                            Navigator.popAndPushNamed(context, '/pNav');
                          }else{
                            // Shows new dialog if password incorrect
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => const MyDialog(
                                  title: 'Incorrect Password'),
                            );
                          }
                        },
                        child: const Text('OK',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),

                      TextButton(         // Cancel Button
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                child: const Text('Return to Profiles',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(themeColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

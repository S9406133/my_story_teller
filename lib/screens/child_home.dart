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

  final bgColor = Colors.teal;
  final buttonColor = Colors.teal;

  String _newText = '';
  final String _childName = users[currentUserIndex].current.firstname;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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

            /* Story List */
            Expanded(
              child: Container(   // Adds top and bottom border
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(),
                    bottom: BorderSide(),
                  ),
                ),
                child: ListView.builder(
                  itemCount: users[currentUserIndex].savedBooks.length,
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
                          title: Text(users[currentUserIndex].savedBooks[index].title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(users[currentUserIndex].savedBooks[index].description,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                '${users[currentUserIndex].savedBooks[index].image}'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            /* Exit Button */
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                            fillColor: bgColor[50],
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
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(38, 10, 38, 10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/user.dart';

/* Saved Books screen - Route: '/saved' */

class SavedBooks extends StatelessWidget {
  const SavedBooks({Key? key}) : super(key: key);

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
      /* App Bar */
      appBar: AppBar(
        backgroundColor: bgColor[300],
        title: const Text('Saved Books'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            /* Story List */
            Expanded(
              child: ListView.builder(
                itemCount: users[currentUserIndex].savedBooks.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: Card(

                      child: Container(
                          padding: const EdgeInsets.all(4.0),
                          height: 150,
                          child: Column(    // Overall column
                            children: [

                              Row(          // Image and description row
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(    // Image Container
                                    height: 80,
                                    width: 80,
                                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Image.asset('${users[currentUserIndex].savedBooks[index].image}'),
                                  ),
                                  Column(       // Description column
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 270,
                                        height: 27,
                                        child: Text(users[currentUserIndex].savedBooks[index].title,  // Title text
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(       // Description text
                                        width: 270,
                                        height: 63,
                                        child: Text(users[currentUserIndex].savedBooks[index].description,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                    icon: const Icon(Icons.play_arrow,
                                        color: Colors.black
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          buttonColor[100]),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.fromLTRB(0, 0, 20, 0)),
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
                                        color: Colors.red
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          buttonColor[100]),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(6)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

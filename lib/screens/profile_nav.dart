import 'package:flutter/material.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/dialog_box.dart';
import 'package:my_story_teller/elements/logout_button.dart';

/* Profile navigation screen - Route 'pNav' */

class ProfileNav extends StatefulWidget {
  const ProfileNav({Key? key}) : super(key: key);

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {

  final bgColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor[100],
      /* App Bar */
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor[300],
        title: const Text('Select User'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 10.0),
            /* Heading */
            const Text('MY STORY TELLER',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: Text('Who is using the app today?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /* Profile Buttons */
            Expanded(
              child: ListView.builder(
                itemCount: users[currentUserIndex].numProfiles(),
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 35.0,
                    ),
                    child: Card(
                      child: ListTile(
                        onTap: (){
                          users[currentUserIndex].setCurrentProfile(index);

                          if (users[currentUserIndex].getProfile(index).isChild == true){
                            // Removes previous routes from the stack so the child can't press
                            // the OS back button to get to the parents section.
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/cHome", (Route<dynamic> route) => false);
                          } else {
                            //Navigator.pushNamed(context, '/pHome');
                            String newText = '';
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Passcode required to enter adult home screen',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                content: const Text('Please enter User Passcode',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                actions: <Widget>[

                                  SizedBox(       // Passcode text field in dialog
                                    width: 100,
                                    child: TextField(
                                      onChanged: (text) {
                                        newText = text;
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
                                      // Checks if passcode entered matches
                                      if (users[currentUserIndex].currProfile.passcode == newText) {
                                        Navigator.popAndPushNamed(context, '/pHome');
                                      }else{
                                        // Shows new dialog if password incorrect
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) => const OKDialog(
                                              title: 'Incorrect Passcode'),
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
                            );
                          }
                        },
                        title: Text(users[currentUserIndex].getProfile(index).firstname,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(users[currentUserIndex].getProfile(index).profIcon,
                          size: 50,
                          color: Colors.lightBlueAccent,
                        ),
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



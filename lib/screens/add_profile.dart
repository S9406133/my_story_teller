import 'package:flutter/material.dart';
import 'package:my_story_teller/elements/input_line.dart';
import 'package:my_story_teller/elements/dialog_box.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:my_story_teller/elements/logout_button.dart';

/* Add Family screen - Route: '/addProf' */

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final themeColor = Colors.blueGrey;

  final User _currentUser = users[currentUserIndex];

  // Variables to save radio button state
  Object? val = 0;
  bool _selected = true;

  // Variables for text entry
  String firstName = '', lastName = '', email = '', passcode = '';

  // Sets the bool variable for the radio selection
  void setSelected(){
    if (val == 0){
      _selected = true;
    }else{
      _selected = false;
    }
  }

  // Method to check all fields have data entered
  bool fieldsEmpty(){
    bool empty = true;

    if (_selected == true){
      if(firstName.isEmpty || lastName.isEmpty){
        empty = true;
      } else {
        empty = false;
      }
    } else {
      if (firstName.isEmpty || lastName.isEmpty || email.isEmpty ||
          passcode.isEmpty) {
        empty = true;
      } else {
        empty = false;
      }
    }

    // Displays error dialog if required fields are empty
    if (empty == true){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
        const MyDialog(
            title: 'Please enter data in all fields'),
      );
    }

    return empty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: themeColor[300],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(
                context, "/pHome", (Route<dynamic> route) => false);
          },
        ),
        title: const Text('Update User Profiles'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
        actions: const <Widget>[
          LogoutButton(),
        ],
      ),

      body:SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              children: <Widget>[

                /* Heading */
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 35),
                  child: Text('Please enter profile details',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /* Data Input Lines */
                InputLine(label: 'First Name',
                  onChanged: (text) {firstName = text;},
                ),
                InputLine(label: 'Last Name',
                  onChanged: (text) {lastName = text;},
                ),

                Visibility(       // These lines displayed if radio not selected
                  visible: !_selected,
                  replacement: const SizedBox(height: 116,),
                  child: InputLine(label: 'Email',
                    onChanged: (text) {email = text;},
                  ),
                ),
                Visibility(
                  visible: !_selected,
                  child: ObscuredInputLine(label: 'Passcode',
                    onChanged: (text) {passcode = text;},
                  ),
                ),

                const SizedBox(height: 10.0),

                /* Child selection radio button & text */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 0,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                          setSelected();
                        });
                      },
                      toggleable: true,
                      splashRadius: 30,
                    ),
                    const Text('User is a child',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /* Bottom Buttons */
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(        // Add button
                        onPressed: () {
                          bool isChild;
                          String type;

                          if (val == 0) {
                            isChild = true;
                            type = 'Child';
                          } else{
                            isChild = false;
                            type = 'Adult';
                          }

                          bool empty = fieldsEmpty();

                          if (empty == false) { // If fields aren't empty

                            if (isChild == false) {  // If profile is Adult
                              // Creates a new adult profile and shows success dialog
                              _currentUser.addProfile(firstName, lastName, isChild);
                              _currentUser.profiles[_currentUser.numProfiles() - 1].setPasscode(passcode);
                              _currentUser.profiles[_currentUser.numProfiles() - 1].setEmail(email);
                              Navigator.pop(context);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                      title: Text('$type profile for $firstName '
                                          'successfully added',
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton( // Closes and reopens the screen to clear it
                                          onPressed: () =>
                                              Navigator.popAndPushNamed(
                                                  context, '/addProf'),
                                          child: const Text('OK',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                            }else{
                              // Creates new child profile then shows success dialog
                              _currentUser.addProfile(firstName, lastName, isChild);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                      title: Text('$type profile for $firstName '
                                          'successfully added',
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton( // Closes and reopens the screen to clear it
                                          onPressed: () =>
                                              Navigator.popAndPushNamed(
                                                  context, '/addProf'),
                                          child: const Text('OK',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          }
                        },

                        child: const Text('ADD PROFILE',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(themeColor[100]),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50,),

                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(         // Remove button
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => const RemoveDialog(),
                          );
                        },
                        child: const Text('REMOVE PROFILE',
                          style: TextStyle(
                            fontSize: 22,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Dialog shown when removing profiles
class RemoveDialog extends StatefulWidget {
  const RemoveDialog({Key? key}) : super(key: key);

  @override
  _RemoveDialogState createState() => _RemoveDialogState();
}

class _RemoveDialogState extends State<RemoveDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Profiles',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        Column(
          children: [

            Container(
              alignment: Alignment.topRight,
              height: 300,
              width: 280,               // List of profiles
              child: ListView.builder(
                itemCount: users[currentUserIndex].profiles.length,
                itemBuilder: (context, index){
                  return ListTile(
                    onTap: () {
                      if (index == 0){    // Shows error dialog if main profile selected
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                          const MyDialog(title: 'Cannot remove main user profile.'),
                        );
                      } else {      // Shows confirmation dialog for other selections
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              RemoveConfirm(profileIndex: index),
                        );
                      }
                    },
                    title: Text(users[currentUserIndex].profiles[index].firstname,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(
                      users[currentUserIndex].profiles[index].profIcon,
                      size: 40,
                    ),
                    tileColor: Colors.white60,
                    selectedTileColor: Colors.white30,
                  );
                },
              ),
            ),

            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Confirmation dialog shown when removing profile
class RemoveConfirm extends StatelessWidget {
  final int profileIndex;
  const RemoveConfirm({Key? key, required this.profileIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Remove profile for '
          '${users[currentUserIndex].profiles[profileIndex].firstname}? ',
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            users[currentUserIndex].removeProfile(profileIndex);
            Navigator.popUntil(context, ModalRoute.withName('/addProf'));
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
              const MyDialog(title: 'Profile removed'),
            );
          },
          child: const Text('OK',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}


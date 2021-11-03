import 'package:flutter/material.dart';
import 'package:my_story_teller/elements/input_line.dart';
import 'package:my_story_teller/elements/dialog_box.dart';
import 'package:my_story_teller/data/user.dart';

/* User registration screen - Route '/regis' */

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;
  bool isChecked = false;
  String firstName = '', lastName = '', email = '', password = '';
  String termsCond = 'These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it. These are the terms and conditions '
      'for using this app, You must agree to them otherwise '
      'we will not let you use it.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: bgColor[100],
      /* App Bar */
      appBar: AppBar(
        backgroundColor: bgColor[300],
        title: const Text('New Account'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 40.0),
                /* Heading */
                const Text('Welcome',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text('Please enter your details',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 45.0),

                /* Data Lines */
                InputLine(label: 'First Name', onChanged: (text) {firstName = text;}),
                InputLine(label: 'Last Name', onChanged: (text) {lastName = text;}),
                InputLine(label: 'Email', onChanged: (text) {email = text;}),
                ObscuredInputLine(label: 'Password', onChanged: (text) {password = text;}),
                const SizedBox(height: 16.0),

                /* Terms and Conditions */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      width: 250,
                      child: const Text('I acknowledge that I have read and '
                          'agree to the terms and conditions',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  child: const Text('View terms & conditions',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,             // T&Cs dialog box
                    builder: (BuildContext context) => SingleChildScrollView(
                      child: AlertDialog(
                        title: const Text('User Terms and Conditions',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        content: Text(termsCond,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /* Bottom Buttons */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(                     // Sign up button
                      onPressed: () {
                        if(firstName.isEmpty || lastName.isEmpty || // If text fields empty
                            email.isEmpty || password.isEmpty){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => const MyDialog(
                                title: 'Please enter data in all fields'),
                          );
                        } else if (isChecked == false) {  // If checkbox not checked
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => const MyDialog(
                                title: 'Please view the terms and conditions'),
                          );
                        }else{            // Creates account
                          createUser(firstName, lastName, email, password);
                          String em = users[currentUserIndex].email;
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Welcome $firstName. User account successfully created.'
                                  '\nPlease note:\nyour email address "$em" is used to login.',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              content: const Text('Select "Update User Profiles" from the home '
                                  'screen to add additional user '
                                  'profiles to your account',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/pHome'),
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
                      },
                      child: const Text('SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                      ),
                    ),
                    const SizedBox(width: 50,),

                    ElevatedButton(                     // Cancel button
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('CANCEL',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 10, 30, 10)),
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





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';

/* Defines User class */
class User {

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  List<Profile> profiles = [Profile('', '', false)];
  Profile current = Profile('', '', false);
  List<Book> savedBooks = [];

  User (this.firstName, this.lastName, this.email, this.password){
    email = email.toLowerCase();
    // Adds user details to first profile
    profiles[0] = Profile(firstName, lastName, false);
    profiles[0].setPasscode(password);
    profiles[0].setEmail(email);
    current = profiles[0];
  }

  void addProfile(Profile newProfile) => profiles.add(newProfile);

  void removeProfile(int index) => profiles.removeAt(index);

  Profile getProfile(int index){
    return profiles[index];
  }

  int numProfiles(){
    return profiles.length;
  }

  void setCurrentProfile(int index) => current = profiles[index];

  void saveBook(Book book) => savedBooks.add(book);

  void addRecording(int index, Recording recording) =>
      books[index].recordings.add(recording);
}

/* Defines user profiles */
class Profile {

  String firstname = '';
  String lastname = '';
  bool isChild = false;
  String email = '';
  String passcode = '';
  var profIcon = Icons.account_box_sharp;

  Profile (this.firstname, this.lastname, this.isChild){
    if (isChild == true) {
      profIcon = Icons.account_box_outlined;
    }
  }

  void setPasscode(String passcode) => this.passcode = passcode;

  void setEmail(String email) => this.email = email;
}

// Creates a test user and associated profiles
List<User> users = [User('Tom', 'King', 'tom@mail.com', '1234')];

void addTestProfiles() {
  users[0].addProfile(Profile('Lucy', 'King', false));
  users[0].getProfile(1).setEmail('lucy@mail.com');
  users[0].getProfile(1).setPasscode('1234');
  users[0].addProfile(Profile('Morgan', 'King', true));
  users[0].addProfile(Profile('Steven', 'King', true));
  users[0].addProfile(Profile('Sophie', 'King', true));
  users[0].addProfile(Profile('Andrew', 'King', true));
  users[0].addProfile(Profile('Reggie', 'King', true));
  users[0].addProfile(Profile('Frank', 'King', true));
}

// Saves books and recordings to test user account
void saveTestBooks(){
  for(int i = 0; i < books.length; i++){
    users[0].saveBook(books[i]);
  }
}

void addTestRecordings(){
  users[0].addRecording(0, Recording('Tom 0 1', '', '01/10/2021', 100000));
  users[0].addRecording(0, Recording('Lucy 0 2', '', '13/10/2021', 150000));
  users[0].addRecording(2, Recording('Tom 2 1', '', '15/09/2021', 110000));
  users[0].addRecording(2, Recording('Lucy 2 2', '', '20/08/2021', 160000));
  users[0].addRecording(2, Recording('Tom 2 3', '', '16/04/2021', 200000));
  users[0].addRecording(2, Recording('Tom 2 4', '', '01/10/2021', 100000));
  users[0].addRecording(3, Recording('Lucy 3 1', '', '13/10/2021', 150000));
  users[0].addRecording(3, Recording('Tom 3 2', '', '15/09/2021', 110000));
  users[0].addRecording(3, Recording('Lucy 3 3', '', '20/08/2021', 160000));
  users[0].addRecording(3, Recording('Tom 3 4', '', '16/04/2021', 200000));
  users[0].addRecording(4, Recording('Tom 4 1', '', '15/09/2021', 110000));
  users[0].addRecording(4, Recording('Lucy 4 2', '', '20/08/2021', 160000));
  users[0].addRecording(4, Recording('Tom 4 3', '', '16/04/2021', 200000));
  users[0].addRecording(4, Recording('Tom 4 4', '', '01/10/2021', 100000));
  users[0].addRecording(4, Recording('Lucy 4 5', '', '13/10/2021', 150000));
}

// List index of logged-in user
int currentUserIndex = 0;

// Adds new user to User List
void createUser(String firstName, lastName, email, password){
  users.add(User(firstName, lastName, email, password));
  currentUserIndex = (users.length - 1);
}

// Adds new profile to current user
void addProfile(String firstname, String lastname, bool child) {
  users[currentUserIndex].addProfile(Profile(firstname, lastname, child));
}

// Used when user logs in returns false if login text doesn't match
// Sets currentUserIndex and returns true if text matches
bool setCurrentUser(String email, password){
  int index = -1;
  for(int i = 0; i < users.length; i++){
    if (users[i].email == email.toLowerCase()){
      index = i;
      break;
    }
  }

  if (index == -1){
    print('No such Email!');
    return false;
  }else if (users[index].password != password){
    print('Incorrect Password!');
    return false;
  }

  currentUserIndex = index;
  return true;
}

int currentBookIndex = 0;

void setCurrentBook(int index) => currentBookIndex = index;



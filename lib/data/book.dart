import 'package:flutter/material.dart';

/* Defines book class */
class Book {

  String title;
  String description;
  String? image = '';
  String? url = '';
  List<String> categories = [];
  List<String> pages = [];
  List<Recording> recordings = [];

  Book({required this.title, required this.description, this.image, this.url});

  void addPage(String location) => pages.add(location);

  void setPage(int index, String location) {
    pages[index] = location;
  }
}

/* Defines the Recording class */
class Recording {
  String recorder;
  String location;
  String date;
  double length;

  Recording(this.recorder, this.location, this.date, this.length);
}

// Creates test list(array) of books
// description has to be maximum 95 characters
List<Book> books = [
  Book(title: 'Ginger the Giraffe',
      description: 'Ginger the giraffe uses her long neck to save the other animals from the blazing forest fire.',
      image: 'assets/GingerTheGiraffe_1.jpg'),

  Book(title: 'Captain Fantastic',
      description: 'Dr. Zob’s evil plans had failed once again, thanks to his wonder dog, Winston.',
      image: 'assets/CaptainFantastic_1.jpg'),

  Book(title: 'Sunny Meadows Woodland School',
      description: 'The class took a little train and went deep into the woods on their first school trip.',
      image: 'assets/SunnyMeadowsWoodlandSchool_1.jpg'),

  Book(title: 'Hide and Seek',
      description: 'Was it just another game of hide and seek? No. It was not.',
      image: 'assets/HideAndSeek_1.jpg'),

  Book(title: 'Case of the Missing Smile',
      description: 'Detective Peterson is trying to find where Sally Sue lost her beautiful smile.',
      image: 'assets/TheCaseOfTheMissingSmile_1.jpg'),
];

void setTestPages() {
  // Load Ginger The Giraffe
  int gingerIndex = 0;
  int gingerPages = 15;
  for (int a = 1; a <= gingerPages; a++) {
    String image = 'assets/GingerTheGiraffe_$a.jpg';
    books[gingerIndex].addPage(image);
  }

  // Load Captain Fantastic
  int captainIndex = 1;
  int captainPages = 14;
  for (int a = 1; a <= captainPages; a++) {
    String image = 'assets/CaptainFantastic_$a.jpg';
    books[captainIndex].addPage(image);
  }

  // Load Sunny Meadows
  int sunnyMIndex = 2;
  int sunnyMPages = 13;
  for (int a = 1; a <= sunnyMPages; a++) {
    String image = 'assets/SunnyMeadowsWoodlandSchool_$a.jpg';
    books[sunnyMIndex].addPage(image);
  }

  // Load Hide and Seek
  int hideSeekIndex = 3;
  int hideSeekPages = 26;
  for (int a = 1; a <= hideSeekPages; a++) {
    String image = 'assets/HideAndSeek_$a.jpg';
    books[hideSeekIndex].addPage(image);
  }

  // Load Missing Smile
  int missingSmileIndex = 4;
  int missingSmilePages = 21;
  for (int a = 1; a <= missingSmilePages; a++) {
    String image = 'assets/TheCaseOfTheMissingSmile_$a.jpg';
    books[missingSmileIndex].addPage(image);
  }
}




import 'package:flutter/material.dart';

/* Defines book class */
class Book {

  String title;
  String author;
  String description;
  String? longDesc = '';
  String? image = 'assets/book_icon.jpg';
  String? url = '';
  List<String>? categories = [];
  List<String> pages = [];
  List<Recording> recordings = [];

  Book({required this.title, required this.author, required this.description,
    this.longDesc, this.categories, this.image, this.url});

  void addPage(String location) => pages.add(location);

  void setPage(int index, String location) {
    pages[index] = location;
  }

  void addRecording(Recording recording) => recordings.add(recording);
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
    author: 'T. Albert',
    description: 'Ginger the giraffe uses her long neck to save the other animals from the blazing forest fire.',
    image: 'assets/GingerTheGiraffe_1.jpg',
    longDesc: 'Read this warm tale of camaraderie and affection set in the wild and beautiful Savannah. '
        'Ginger the giraffe uses her long neck to save the other animals from the blazing forest fire. '
        'Follow them in their jungle paths as they all meet with yet another adventure .',
    categories: ['Animals', 'Friends', 'Adventure'],
  ),

  Book(title: 'Captain Fantastic',
    author: 'T. Albert',
    description: 'Dr. Zob’s evil plans had failed once again, thanks to his wonder dog, Winston.',
    image: 'assets/CaptainFantastic_1.jpg',
    longDesc: 'Dr. Zob’s evil plans had failed once again, thanks to his wonder dog, Winston. '
        'They were just were they had to be, with Princess Aura at her birthday party. '
        'Read on to find out why Winston deserves a big cuddle and a juicy big bone. '
        'A big ‘Woof!’ to this wonderful children’s story book.',
    categories: ['Science Fiction', 'Dog', 'Adventure'],
  ),

  Book(title: 'Sunny Meadows Woodland School',
    author: 'T. Albert',
    description: 'The class took a little train and went deep into the woods on their first school trip.',
    image: 'assets/SunnyMeadowsWoodlandSchool_1.jpg',
    longDesc: 'The class took a little train and went deep into the woods on their first school trip. '
        'But things didn’t go as planned and a whirlwind of adventure unfolds '
        'in this wonderful bed time story book.',
    categories: ['School', 'Friends', 'Adventure'],
  ),

  Book(title: 'Hide and Seek',
    author: 'T. Albert',
    description: 'Was it just another game of hide and seek? No. It was not.',
    image: 'assets/HideAndSeek_1.jpg',
    longDesc: 'Was it just another game of hide and seek? No. It was not. '
        'First she fell into a deep, dark hole in the ground and then they found a treasure. '
        'Did it end there? No! It did not. Read more about this thrilling adventure of '
        'Sally and friends in this free illustrated kids’ book. The fun never ends '
        'when Sally’s around!',
    categories: ['Rescue', 'Friends', 'Adventure'],
  ),

  Book(title: 'Case of the Missing Smile',
    author: 'T. Albert',
    description: 'Detective Peterson is trying to find where Sally Sue lost her beautiful smile.',
    image: 'assets/TheCaseOfTheMissingSmile_1.jpg',
    longDesc: 'Detective Peterson is trying to find where Sally Sue lost her beautiful smile. '
        'And she finds it..right in her heart, hidden from sight. '
        'Read this imaginative story of a little girl and how she learnt to smile '
        'again in this great children’s fairy story.',
    categories: ['Fairy', 'Mystery'],
  ),
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





/* Defines book class */
class Book {

  String title;
  String author;
  String description;
  String? longDesc = '';
  String? image = 'assets/book_icon.jpg';
  List<String>? categories = [];
  List<String>? pages = [];

  Book({required this.title, required this.author, required this.description,
    this.longDesc, this.categories, this.pages, this.image});

  void addPage(String location) => pages!.add(location);

  void setPage(int index, String location) {
    pages![index] = location;
  }
}

// Creates test list(array) of books
// description has to be maximum 95 characters
List<Book> books = [];

void setBookData() {
  // Load Ginger The Giraffe
  List<String> gg = [];
  int gingerPages = 15;
  for (int a = 1; a <= gingerPages; a++) {
    String image = 'assets/GingerTheGiraffe_$a.jpg';
    gg.add(image);
  }

  // Load Captain Fantastic
  List<String> cf = [];
  int captainPages = 14;
  for (int a = 1; a <= captainPages; a++) {
    String image = 'assets/CaptainFantastic_$a.jpg';
    cf.add(image);
  }

  // Load Sunny Meadows
  List<String> sm = [];
  int sunnyMPages = 13;
  for (int a = 1; a <= sunnyMPages; a++) {
    String image = 'assets/SunnyMeadowsWoodlandSchool_$a.jpg';
    sm.add(image);
  }

  // Load Hide and Seek
  List<String> hs = [];
  int hideSeekPages = 26;
  for (int a = 1; a <= hideSeekPages; a++) {
    String image = 'assets/HideAndSeek_$a.jpg';
    hs.add(image);
  }

  // Load Missing Smile
  List<String> ms = [];
  int missingSmilePages = 21;
  for (int a = 1; a <= missingSmilePages; a++) {
    String image = 'assets/TheCaseOfTheMissingSmile_$a.jpg';
    ms.add(image);
  }

  books = [
    Book(title: 'Ginger the Giraffe',
      author: 'T. Albert',
      description: 'Ginger the giraffe uses her long neck to save the other animals from the blazing forest fire.',
      image: 'assets/GingerTheGiraffe_1.jpg',
      longDesc: 'Read this warm tale of camaraderie and affection set in the wild and beautiful Savannah. '
          'Ginger the giraffe uses her long neck to save the other animals from the blazing forest fire. '
          'Follow them in their jungle paths as they all meet with yet another adventure .',
      categories: ['Animals', 'Friends', 'Adventure'],
      pages: gg,
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
      pages: cf,
    ),

    Book(title: 'Sunny Meadows Woodland School',
      author: 'T. Albert',
      description: 'The class took a little train and went deep into the woods on their first school trip.',
      image: 'assets/SunnyMeadowsWoodlandSchool_1.jpg',
      longDesc: 'The class took a little train and went deep into the woods on their first school trip. '
          'But things didn’t go as planned and a whirlwind of adventure unfolds '
          'in this wonderful bed time story book.',
      categories: ['School', 'Friends', 'Adventure'],
      pages: sm,
    ),

    Book(title: 'Hide and Seek',
      author: 'T. Albert',
      description: 'Was it just another game of hide and seek? No. It was not.',
      image: 'assets/HideAndSeek_1.jpg',
      longDesc: 'Was it just another game of hide and seek? No. It was not. '
          'First she fell into a deep, dark hole in the ground and then they found a treasure. '
          'Did it end there? No! It did not. Read more about this thrilling adventure of '
          'Sally and friends in this illustrated kids’ book. The fun never ends '
          'when Sally’s around!',
      categories: ['Rescue', 'Friends', 'Adventure'],
      pages: hs,
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
      pages: ms,
    ),
  ];
}

// Variable to hold the book selected from a list (search)
// if not saved to the users book list
Book selectedBook = books[0];

void setSelectedBook (Book book){
  selectedBook = book;
}




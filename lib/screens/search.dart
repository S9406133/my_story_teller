import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';

/* Search screen - Route '/search' */

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final themeColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  // List of books returned by the search method
  List<Book> _searchList = [];
  bool _noResult = false;
  // Value entered into the Search text box
  String _newText = '';
  // Value selected in the dropdown list
  String _dropdownValue = 'Title';

  @override
  void initState() {
    _noResult = false;
    super.initState();
  }

  // Search function called when button is pressed
  // Searches by dropdown value and adds results to searchlist
  void searchBooks() {
    _searchList = [];
    _noResult = false;
    if (_newText.isEmpty){
      return;
    }

    for (int i=0; i < books.length; i++){
      switch(_dropdownValue){
        case 'Title':
          if(books[i].title.toLowerCase().contains(_newText.toLowerCase())){
            _searchList.add(books[i]);
          }
          break;
        case 'Author':
          if(books[i].author.toLowerCase().contains(_newText.toLowerCase())){
            _searchList.add(books[i]);
          }
          break;
        case 'Category':
          for (int a=0; a < books[i].categories!.length; a++) {
            if (books[i].categories![a].toLowerCase().contains(_newText.toLowerCase())) {
              _searchList.add(books[i]);
              break;
            }
          }
          break;
      }
    }
    // Sets variable if search results found or not
    if(_searchList.isEmpty){
      _noResult = true;
    } else {
      _noResult = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* App Bar */
      appBar: AppBar(
        backgroundColor: themeColor[300],
        title: const Text('Book Search'),
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
            const SizedBox(height: 10,),
            /* Search Bar */
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: 280,
              child: TextField(
                onChanged: (text) {
                  _newText = text;
                },
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  hintText: 'Search',
                  filled: true,
                  fillColor: themeColor[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  decoration: BoxDecoration(
                    color: themeColor[50],
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 10, 50, 10),
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),

                  child: DropdownButton<String>(      // Dropdown Button
                    value: _dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 40,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _dropdownValue = newValue!;
                      });
                    },              // Item list
                    items: <String>['Title', 'Author', 'Category']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                FloatingActionButton(     // Search Button
                  backgroundColor: buttonColor,
                  onPressed: (){
                    // Unfocuses text box so keyboard closes
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {     // Resets searchlist and does new search
                      searchBooks();
                    });
                  },
                  child: const Icon(Icons.search,
                    size: 40,
                  ),
                ),
              ],
            ),

            Visibility(
              visible: _noResult,
              child: Expanded(
                child: Container(   // Adds top border
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeColor[100],
                    border: const Border(
                      top: BorderSide(),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Text('No Result',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /* Display of Search List */
            Visibility(
              visible: !_noResult,
              child: Expanded(
                child: Container(   // Adds top border
                  decoration: BoxDecoration(
                    color: themeColor[100],
                    border: const Border(
                      top: BorderSide(),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: _searchList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child: Card(
                          child: ListTile(
                            onTap: (){
                              setSelectedBook(_searchList[index]);
                              Navigator.pushNamed(context, '/bookDescr');
                            },
                            isThreeLine: true,
                            title: Text(_searchList[index].title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(_searchList[index].description,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('${_searchList[index].image}'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

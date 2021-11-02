import 'package:flutter/material.dart';
import 'package:my_story_teller/screens/update_settings.dart';
import 'package:my_story_teller/screens/parent_home.dart';
import 'package:my_story_teller/screens/search.dart';
import 'package:my_story_teller/screens/saved_books.dart';
import 'package:my_story_teller/screens/add_profile.dart';

/* Any screen which has a bottom nav element will be routed here
   then opened in the body */

class BottomNav extends StatefulWidget {
  // Used to pass the Bottom nav index of current screen
  final int index;
  const BottomNav({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState(index);
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex;
  _BottomNavState(this.currentIndex);

  static const bgColor = Colors.blueGrey;

  // List of nav routes for bottom nav
  List<Widget> bottomNavRoutes = [
    const ParentHome(),
    const AddProfile(),
    const Search(),
    const SavedBooks(),
    const UpdateSettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen of current index is displayed in the body
      body: bottomNavRoutes[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        // Sets the index of the icon tapped to the currentIndex
        onTap: (index) => setState(() => currentIndex = index),
        iconSize: 35,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profiles',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: bgColor,
          ),
        ],
      ),
    );
  }
}

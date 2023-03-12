import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import '../screens/home/home_screen.dart';
import '../screens/mysleep/my_sleep_screen.dart';
import '../screens/library/library_screen.dart';
import '../screens/sleeptools/menu_screen.dart';

class BottomNavigator extends StatefulWidget {
  Function navigationHandler;
  final int selectedPageIndex;

  BottomNavigator(this.navigationHandler, this.selectedPageIndex);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  final List<Map<String,dynamic>> _pages = [
    {
      'icon' : Icon(Icons.home,color: Colors.black),
      'label' : 'Home',
      'page' : HomeBody(),
    },
    {
      'icon' : Icon(Icons.bar_chart, color: Colors.black),
      'label' : 'My Sleep',
      'page' : MySleepScreen(),
    },
    {
      'icon' : Icon(Icons.library_add, color: Colors.black),
      'label' : 'Library',
      'page' : LibraryScreen(),
    },
    {
      'icon' : Icon(Icons.menu, color: Colors.black),
      'label' : 'Menu',
      'page': MenuScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        widget.navigationHandler(index);
      },
      items: _pages.map((page) => BottomNavigationBarItem(icon: page['icon'], label: page['label'])).toList(),
      currentIndex: widget.selectedPageIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}

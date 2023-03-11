import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/mysleep/my_sleep_screen.dart';
import '../screens/library/library_screen.dart';
import '../screens/sleeptools/menu_screen.dart';

class BottomNavigator extends StatefulWidget {

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final List<Map<String,dynamic>> _pages = [
    {
      'icon' : Icon(Icons.home,color: Colors.black),
      'label' : 'Home',
      'page' : HomeScreen.routeName,
    },
    {
      'icon' : Icon(Icons.bar_chart, color: Colors.black),
      'label' : 'My Sleep',
      'page' : MySleepScreen.routeName,
    },
    {
      'icon' : Icon(Icons.library_add, color: Colors.black),
      'label' : 'Library',
      'page' : LibraryScreen.routeName,
    },
    {
      'icon' : Icon(Icons.menu, color: Colors.black),
      'label' : 'Menu',
      'page': MenuScreen.routeName,
    }
  ];

  int selectedPageIndex = 0;

  void _bottomTabHandler(int selectedIndex){
    if(selectedPageIndex == selectedIndex){
      return;
    }
    setState(() {
      selectedPageIndex = selectedIndex;
    });
    Navigator.of(context).pushNamed(_pages[selectedIndex]['page']);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _bottomTabHandler,
      items: _pages.map((page) => BottomNavigationBarItem(icon: page['icon'], label: page['label'])).toList(),
      currentIndex: selectedPageIndex,
      selectedItemColor: Colors.blue,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/sleeptools/menu_screen.dart';
import '../../navigators/drawer.dart';
import '../../navigators/bottomNavigator.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  final _pageList = [
    HomeBody(),
    MySleepScreen(),
    LibraryScreen(),
    MenuScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  void _bottomTabHandler(int selectedIndex){
    if(selectedPageIndex == selectedIndex){
      return;
    }
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Center(
          child: TextButton(
            child: Text(
              'Homepage',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            onPressed: () {
                // Implement a scroll to top here, on every page! A single function will be fine.
            },
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.chat_rounded),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigator(_bottomTabHandler, selectedPageIndex),
      body: widget._pageList[selectedPageIndex],
    );
  }
}

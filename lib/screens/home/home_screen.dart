import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/menu/menu_screen.dart';

import 'package:night_gschallenge/screens/plan/PlanScreen.dart';


import 'package:night_gschallenge/widgets/UI/top_row.dart';
import '../../navigators/bottomNavigator.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final _pageList = [
    HomeBody(),
    MySleepScreen(),
    PlanScreen(),
    LibraryScreen(),
    MenuScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  void _bottomTabHandler(int selectedIndex) {
    if (selectedPageIndex == selectedIndex) {
      return;
    }
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigator(_bottomTabHandler, selectedPageIndex),
      body: ListView(
        children: [
          TopRow(),
          widget._pageList[selectedPageIndex],
        ],
      ),
    );
  }
}

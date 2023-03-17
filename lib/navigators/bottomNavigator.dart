import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
import 'package:night_gschallenge/widgets/UI/form.dart';
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
  final List<Map<String, dynamic>> _pages = [
    {
      'icon': Icon(Icons.home, color: Colors.black),
      'label': 'Home',
      'page': HomeBody(),
    },
    {
      'icon': Icon(Icons.bar_chart, color: Colors.black),
      'label': 'My Sleep',
      'page': MySleepScreen(),
    },
    {
      'icon': Icon(Icons.library_add, color: Colors.black),
      'label': 'My Plan',
      'page': PlanScreen(),
    },
    {
      'icon': Icon(Icons.library_add, color: Colors.black),
      'label': 'Library',
      'page': SleepForm(),
    },
    {
      'icon': Icon(Icons.menu, color: Colors.black),
      'label': 'Menu',
      'page': MenuScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          height: 100,
          indicatorColor: Theme.of(context).primaryColor,
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ))),
      child: NavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        selectedIndex: widget.selectedPageIndex,
        onDestinationSelected: (value) {
          widget.navigationHandler(value);
        },
        destinations: _pages
            .map((item) =>
                NavigationDestination(icon: item['icon'], label: item['label']))
            .toList(),
      ),
    );

    // return BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     currentIndex: widget.selectedPageIndex,
    //     items: _pages
    //         .map((item) => BottomNavigationBarItem(
    //               icon: item['icon'],
    //               label: item['label'],
    //             ))
    //         .toList(),
    //     onTap: (value) {
    //       widget.navigationHandler(value);
    //     },
    // );
  }
}

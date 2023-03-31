import 'package:flutter/material.dart';

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
      'icon': const Icon(Icons.home, color: Colors.black),
      'label': 'Home',
    },
    {
      'icon': const Icon(Icons.bar_chart, color: Colors.black),
      'label': 'My Sleep',
    },
    {
      'icon': const Icon(Icons.library_add, color: Colors.black),
      'label': 'My Plan',
    },
    {
      'icon': const Icon(Icons.library_add, color: Colors.black),
      'label': 'Library',
    },
    {
      'icon': const Icon(Icons.menu, color: Colors.black),
      'label': 'More',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 100,
        indicatorColor: Theme.of(context).canvasColor,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
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
  }
}

import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  Function navigationHandler;
  final int selectedPageIndex;

  BottomNavigator(this.navigationHandler, this.selectedPageIndex);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Map<String, dynamic>> _pages = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pages = [
      {
        'icon': Icon(Icons.home, color: Theme.of(context).iconTheme.color),
        'label': 'Home',
      },
      {
        'icon': Icon(Icons.bar_chart, color: Theme.of(context).iconTheme.color),
        'label': 'My Sleep',
      },
      {
        'icon':
            Icon(Icons.library_add, color: Theme.of(context).iconTheme.color),
        'label': 'My Plan',
      },
      {
        'icon': Icon(Icons.library_music_rounded,
            color: Theme.of(context).iconTheme.color),
        'label': 'Library',
      },
      {
        'icon': Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
        'label': 'More',
      }
    ];
  }

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
        backgroundColor: Theme.of(context).primaryColor,
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

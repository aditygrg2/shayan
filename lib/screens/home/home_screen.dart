import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/navigators/drawer_search.dart';
import 'package:night_gschallenge/providers/shared_preferences_provider.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/menu/menu_screen.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';
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
  bool loading = true;
  bool once = true;
  String mode = "";

  void switchPageHandler(int selectedIndex) {
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  void _bottomTabHandler(int selectedIndex) {
    if (selectedPageIndex == selectedIndex) {
      return;
    }
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  void fetch() async {
    var spp = Provider.of<sharedPreferencesProvider>(context);

    await spp.init();
    mode = spp.getValue('launch', 'mode').toString();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (once) {
      fetch();
      once = false;
    }
    return Scaffold(
      bottomNavigationBar:
          BottomNavigator(_bottomTabHandler, selectedPageIndex),
      body: loading
          ? CircularProgressIndicator()
          : GestureDetector(
              onHorizontalDragEnd: (details) {
                Velocity v = details.velocity;
                if (v.pixelsPerSecond.dx > v.pixelsPerSecond.dy) {
                  if (selectedPageIndex == 0) {
                  } else {
                    switchPageHandler(selectedPageIndex - 1);
                  }
                } else {
                  if (selectedPageIndex == 4) {
                  } else {
                    switchPageHandler(selectedPageIndex + 1);
                  }
                }
              },
              child: ListView(
                children: [
                  TopRow(),
                  widget._pageList[selectedPageIndex],
                ],
              ),
            ),
    );
  }
}

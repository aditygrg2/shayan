import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/sleeptools/menu_screen.dart';
import './screens/home/home_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Night_GSChallenge',
      theme: ThemeData(
          /**Define themes here - Appwide */
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              headlineSmall: TextStyle(
                fontSize: 15,
              ))),
      home: HomeScreen(),
      routes: {
        LibraryScreen.routeName: (ctx) => LibraryScreen(),
        MySleepScreen.routeName: (ctx) => MySleepScreen(),
        MenuScreen.routeName: (ctx) => MenuScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
      },
    );
  }
}

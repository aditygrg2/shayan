import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
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
        primaryColor: Color.fromRGBO(225, 236, 232, 1),
        backgroundColor:Color.fromRGBO(225, 236, 232, 1) ,
        scaffoldBackgroundColor: Color.fromRGBO(225, 236, 232, 1),
        fontFamily: 'JejuGothic',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: 15,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
          labelLarge: TextStyle(
            fontSize: 25,
          ),
          labelMedium: TextStyle(
            fontSize: 15,
          )
        ),
      ),
      routes: {
        '/' :(context) => HomeScreen(),
        LibraryScreen.routeName: (ctx) => LibraryScreen(),
        MySleepScreen.routeName: (ctx) => MySleepScreen(),
        MenuScreen.routeName: (ctx) => MenuScreen(),
        PlanScreen.routeName: (ctx) => PlanScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
      },
    );
  }
}

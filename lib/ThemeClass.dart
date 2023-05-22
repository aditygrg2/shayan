import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    canvasColor: const Color.fromRGBO(251, 145, 92, 1),
    accentColor: const Color.fromRGBO(251, 145, 92, 0.85),
    cardColor: const Color.fromARGB(153, 248, 222, 55),
    fontFamily: 'Roboto',
    secondaryHeaderColor: Colors.black,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    highlightColor: Colors.white,
    buttonColor: const Color.fromRGBO(247, 219, 198, 1),
    splashColor: const Color.fromRGBO(251, 167, 14, 0.5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(247, 219, 198, 1),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(
        const Color.fromRGBO(247, 219, 198, 1),
      ),
      visualDensity: VisualDensity.comfortable,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'OpenSans',
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        fontFamily: 'OpenSans',
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'OpenSans',
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
      ),
      bodyLarge: TextStyle(
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
      ),
      labelLarge: TextStyle(
        fontSize: 25,
        fontFamily: 'Montserrat',
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontFamily: 'Montserrat',
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: Colors.black
      )
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    secondaryHeaderColor: Colors.white,
    brightness: Brightness.dark,
    canvasColor: const Color.fromRGBO(204, 97, 93, 1),
    highlightColor: Colors.amber,
    accentColor: Color.fromRGBO(224, 221, 148, 1),
    cardColor: const Color.fromRGBO(71, 152, 146, 1),
    fontFamily: 'Roboto',
    buttonColor: const Color.fromRGBO(252, 235, 93, 1),
    splashColor: const Color.fromRGBO(251, 167, 14, 0.5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(247, 219, 198, 1),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(
        const Color.fromRGBO(245, 254, 169, 1),
      ),
      visualDensity: VisualDensity.comfortable,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        fontFamily: 'OpenSans',
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'OpenSans',
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
      ),
      labelLarge: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: Colors.white
      )
    ),
  );
}
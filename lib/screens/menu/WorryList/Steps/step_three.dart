import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/WorryList/ResolutionCards.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class StepThree extends StatelessWidget {
  static const routeName = 'menu/stepthree';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: 'Get Them Out',
          ),
          ResolutionCards(),
        ],
      ),
    );
  }
}

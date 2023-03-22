import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/InformativeText.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class SleepCycleCalculator extends StatelessWidget {
  static const routeName = 'menu/sleepcyclecalculator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: 'Sleep Cycle Calculator',
          ),
          MenuHeroImage(
            image: 'assets/sleepcyclecalculator.gif',
          ),
          InformativeText(
            text:
                'Track different stages of your sleep and wake up during your lightest stage',
            icon: Icons.sunny,
          ),
          Container(
            child: Column(
              
            ),
          )

        ],
      ),
    );
  }
}

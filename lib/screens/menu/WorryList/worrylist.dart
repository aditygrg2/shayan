import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_one.dart';
import 'package:night_gschallenge/widgets/UI/InformativeText.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Worrylist extends StatefulWidget {
  static const routeName = 'menu/worrylist';

  @override
  State<Worrylist> createState() => _WorrylistState();
}

class _WorrylistState extends State<Worrylist> {
  List<String> _steps = [
    'Adding worries to a list',
    'Distributing worries to solvable or non-solvable',
    'Managing and finding solution to worries',
    'Implementation of solutions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        TopRow(
          back: true,
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Theme.of(context).canvasColor,
          ),
          child: Column(children: [
            Text(
              'Worry List',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            MenuHeroImage(
              image: 'assets/worry.gif',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'It is not surprising that some of us may use our problem solving skills at the wrong times and places, namely bedtime. We may think about a problem, trying to solve it, but unfortunately, the anxiety caused by the problem will keep us awake. Constructive worry is a method for managing the tendency to worry during that quiet time when sleep is supposed to be taking over.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'This will work in 4 steps :',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ..._steps.map((step) {
              return ListTile(
                leading: Image.asset('assets/check-mark.png'),
                title: Text(step),
              );
            }),
          ]),
        ),
        Center(
          child: ElevatedButtonWithoutIcon(
            text: 'Proceed',
            onPressedButton: (){
              Navigator.of(context).pushNamed(StepOne.routeName);
            },
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise_solutions.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/tmb_description_cards.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MentalExercise extends StatelessWidget {
  List<Map<String, String>> options = [
    {
      'title': 'Visualization',
      'subtitle':
          'Involves creating a mental image or scenario that is soothing, calming, and peaceful, which can help promote feelings of relaxation and calmness that are conducive to sleep.',
      "image": 'assets/visualization.png',
      "route": '',
    },
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
<<<<<<< HEAD
          'used to controlstress and anxiety, relieveinsomnia, and reduce symptoms of certain types of chronic pain',
=======
          'By systematically tensing and relaxing different muscle groups, it makes user more aware of areas of tension in their body and learn to release that tension through intentional relaxation techniques',
      "image": 'relaxation.png',
>>>>>>> 05fec1483238b09e1e277458d786cd5928906fd6
      "route": MentalExerciseSolution.routeName,
      "image": 'assets/relaxation.png',
    },
    {
      'title': 'Meditation',
      'subtitle':
          'Mental practice that involves focusing the mind on a particular object, thought, or activity to achieve a state of calmness, relaxation, and mental clarity',
      "image": 'assets/meditation.png',
      "route": '',
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'Using self-suggestion to create a sense of relaxation and well-being in the body.involves repeating a set of phrases or mental images that are designed to create feelings of warmth, heaviness, and relaxation in different parts of the bod',
      "image": 'assets/autogenic_relaxation.png',
      "route": '',
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'Relaxation technique that involves taking slow, deep breaths from the diaphragm to promote relaxation and reduce stress and anxiety.',
      "image": 'assets/deep_breathing.png',
      "route": '',
    },
  ];
  static String routeName = '/mental-exercise';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        TopRow(
          back: true,
        ),
        HomeScreenText(
          text: "Mental Exercises",
        ),
        MenuHeroImage(
          image: 'assets/mentalExercises.gif',
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Column(children: [
                  ...options.map((card) {
                    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(card['route']);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          )
        ),
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: widthi * 0.5,
              padding: EdgeInsets.only(left: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
            Expanded(child: Image.asset(image!)),
          ],
        ),
      ),
    );
                  }).toList(),
                  SizedBox(
                    height: 50,
                  )
                ]),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

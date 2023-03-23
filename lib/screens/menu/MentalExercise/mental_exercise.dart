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
          'Instead of focusing on your anxious, fearful images, visualization expands your ability to focus on calming and restful images',
      "image": 'assets/visualization.png',
      "route": '',
    },
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
          'used to controlstress and anxiety, relieveinsomnia, and reduce symptoms of certain types of chronic pain',
      "image": 'relaxation.png',
      "route": MentalExerciseSolution.routeName,
      "image": 'assets/relaxation.png',
    },
    {
      'title': 'Meditation',
      'subtitle':
          'meditation practices enhance melatonin levels and hence quality of sleep',
      "image": 'assets/meditation.png',
      "route": '',
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'adds in self-statements about heaviness and warmth in each part of the body',
      "image": 'assets/autogenic_relaxation.png',
      "route": '',
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'Instead of focusing on your anxious, fearful images, visualization expands your ability to focus on calming and restful images.',
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
                    return TmbDescriptionCards(
                      title: card['title'],
                      subtitle: card['subtitle'],
                      image: card['image'],
                      route: card['route'],
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

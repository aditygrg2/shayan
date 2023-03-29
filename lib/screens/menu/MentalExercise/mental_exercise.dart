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
          'involves creating a mental image or scenario that is soothing, calming, and peaceful, which can help promote feelings of relaxation and calmness that are conducive to sleep.',
      "image": 'assets/visualization.png',
      "route": '',
    },
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
          'By systematically tensing and relaxing different muscle groups, it makes user more aware of areas of tension in their body and learn to release that tension through intentional relaxation techniques',
      "image": 'relaxation.png',
      "route": MentalExerciseSolution.routeName,
      "image": 'assets/relaxation.png',
    },
    {
      'title': 'Meditation',
      'subtitle':
          'mental practice that involves focusing the mind on a particular object, thought, or activity to achieve a state of calmness, relaxation, and mental clarity',
      "image": 'assets/meditation.png',
      "route": '',
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'using self-suggestion to create a sense of relaxation and well-being in the body.involves repeating a set of phrases or mental images that are designed to create feelings of warmth, heaviness, and relaxation in different parts of the bod',
      "image": 'assets/autogenic_relaxation.png',
      "route": '',
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'relaxation technique that involves taking slow, deep breaths from the diaphragm to promote relaxation and reduce stress and anxiety.',
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

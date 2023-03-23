import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise_solutions.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/tmb_description_cards.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MentalExercise extends StatelessWidget {
  List<Map<String, String>> options = [
    {
      'title': 'Visualization',
      'subtitle':
          'Instead of focusing on your anxious, fearful images, visualization expands your ability to focus on calming and restful images',
      "image": 'visualization.png',
      "route": '',
    },
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
          'used to controlstress and anxiety, relieveinsomnia, and reduce symptoms of certain types of chronic pain',
      "image": 'relaxation.png',
      "route": MentalExerciseSolution.routeName,
    },
    {
      'title': 'Meditation',
      'subtitle':
          'meditation practices enhance melatonin levels and hence quality of sleep',
      "image": 'meditation.png',
      "route": '',
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'adds in self-statements about heaviness and warmth in each part of the body',
      "image": 'autogenic_relaxation.png',
      "route": '',
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'Instead of focusing on your anxious, fearful images, visualization expands your ability to focus on calming and restful images.',
      "image": 'deep_breathing.png',
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
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 300,
              child: Image.network(
                  "https://s3-alpha-sig.figma.com/img/d4f2/7cbd/ca98d4c6b8cc8226e09d56880b80c49a?Expires=1680480000&Signature=GUHRq-JY9vJ~Ndt~NFOC71cna3Bl04i-VnHz9XgTIaMmSpRF1H36MsmczcFTl1~eqntFKVzXWTEC-OlJk7y93YRRIv6YyGiIWBRTihiwFbygpCj7WJQ-N-c1M5EhRULNSLF3vuxzEEtTISXTBIZKbIZZsWkjHFzkVrT-N5SH15TE-IATi8xnTSeQ5qJCT90RAHQyrPqwf5Fgar9qgy9m5EeMIC3Vu-FbI0V8VXJ-OH361kGl0h~0xFgIdt4nhaTGigOUN9FirSPqXKWPpOmf4W3F51sAz0XkOKwteLX9T9j3PbxeOJJFq6zIB1b9~Ca8jnhpvxfQMBu5a7zKV350AQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            ),
            ...options.map((card) {
              return TmbDescriptionCards(
                title: card['title'],
                subtitle: card['subtitle'],
                image: card['image'],
                route: card['route'],
              );
            }).toList()
          ]),
        ),
      ]),
    );
  }
}

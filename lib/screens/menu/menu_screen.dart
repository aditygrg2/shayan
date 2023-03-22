import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import './menu.dart';
import './text_to_speech.dart/text_to_speech.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  List<Map<String, String>> items = [
    {
      'text': 'Test My Bedroom',
      'imagePath': 'assets/test_my_environment.png',
      'routes': TestMyBedroom.routeName
    },
    {'text': 'Phone-Free time', 'imagePath': 'assets/phone_free.png'},
    {
      'text': 'Meditation Timer',
      'imagePath': 'assets/meditation_timer.png',
      'routes': MeditationTimer.routeName
    },
    {
      'text': 'Listen to your stories',
      'imagePath': 'assets/nap_timer.png',
      'routes': TextToSpeechComponent.routeName
    },
    {
      'text': 'Sleep Cycle Calculator',
      'imagePath': 'assets/sleep_cycle_calculator.png'
    },
    {'text': 'Sleep Diet Suggestions', 'imagePath': 'assets/sleep_diet.png'},
    {
      'text': 'Mental Exercises',
      'imagePath': 'assets/mental_exercises.png',
      'routes': MentalExercise.routeName
    },
    {'text': 'Sleep Achievement', 'imagePath': 'assets/sleep_achievement.png'},
    {'text': 'Music Therapy', 'imagePath': 'assets/podcasts_stories.png'},
    {'text': 'Worry List', 'imagePath': 'assets/worry_list.png'},
  ];
  @override
  void navigate(BuildContext context, int index) {
    Navigator.of(context).pushNamed(items[index]['routes'].toString());
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenText(text: 'Sleep Tools'),
        Container(
          width: MediaQuery.of(context).size.width - 20,
          height: (MediaQuery.of(context).size.height / 8) * items.length,
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Menu(
                    text: items[index]['text'].toString(),
                    imagePath: items[index]['imagePath'].toString()),
                onTap: () => navigate(context, index),
              );
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

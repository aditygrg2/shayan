import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/community_screen.dart';
import 'package:night_gschallenge/screens/menu/Maps/google_map.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/phone_free_time.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/SleepinessCalculator/Sleepiness.dart';
import 'package:night_gschallenge/screens/menu/SmartAlarm/smartalarm.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrylist.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/pageBlocks.dart';
import './menu.dart';
import './text_to_speech.dart/text_to_speech.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  List<Map<String, dynamic>> items = [
    {
      'text': 'Test My Bedroom',
      'imagePath': 'assets/test_my_environment.png',
      'routes': TestMyBedroom.routeName
    },
    {
      'text': 'Meditation Timer',
      'imagePath': 'assets/meditation_timer.png',
      'routes': MeditationTimer.routeName
    },
    {
      'text': 'Phone-Free time',
      'imagePath': 'assets/phone_free.png',
      'routes': PhoneFreeTime.routeName,
    },
    {
      'text': 'Sleep Cycle Calculator',
      'imagePath': 'assets/sleep_cycle_calculator.png',
      'routes': SleepCycleCalculator.routeName
    },
    {
      'text': 'Music Therapy',
      'imagePath': 'assets/podcasts_stories.png',
      'routes': MusicTherapy.routeName
    },
    {
      'text': 'Listen to your stories',
      'imagePath': 'assets/nap_timer.png',
      'routes': TextToSpeechComponent.routeName
    },
    {
      'text': 'Sleep Recorder',
      'imagePath': 'assets/smartalarm.png',
      'routes': SmartAlarm.routeName
    },
    {
      'text': 'Worry List',
      'imagePath': 'assets/worry_list.png',
      'routes': Worrylist.routeName
    },
    {
      'text': 'Maps',
      'imagePath': 'assets/maps.png',
      'routes': MapScreen.routeName
    },
    {
      'text': 'Sleep Diet Suggestions',
      'imagePath': 'assets/sleep_diet.png',
      'routes': SleepDietSuggestion.routeName
    },
    {
      'text': 'Mental Exercises',
      'imagePath': 'assets/mental_exercises.png',
      'routes': MentalExercise.routeName
    },
    {
      'text': 'Daytime Sleepiness Calculator',
      'imagePath': 'assets/sleepiness.png',
      'routes': Sleepiness.routeName
    }
  ];
  @override
  void navigate(BuildContext context, int index) {
    Navigator.of(context).pushNamed(items[index]['routes'].toString());
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenText(text: 'More'),
        PageBlocks(
         onTap: () {
            Navigator.of(context).pushNamed(CommunityScreen.routeName);
          },
          image: 'assets/library_community.png',
          title: "Community",
        ),
        Container(
          width: MediaQuery.of(context).size.width - 20,
          height: (MediaQuery.of(context).size.height / 7) * items.length,
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.25,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Menu(
                  text: items[index]['text'],
                  imagePath: items[index]['imagePath'],
                ),
                onTap: () => navigate(context, index),
              );
            },
            itemCount: items.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            "Shayan v1.0 • Google Solution Challenge 2023",
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
        )
      ],
    );
  }
}

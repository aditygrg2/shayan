import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/phone_free_time.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrylist.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
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
      'text': 'Phone-Free time',
      'imagePath': 'assets/phone_free.png',
      'routes': PhoneFreeTime.routeName,
    },
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
      'imagePath': 'assets/sleep_cycle_calculator.png',
      'routes': SleepCycleCalculator.routeName
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
    {'text': 'Sleep Achievement', 'imagePath': 'assets/sleep_achievement.png'},
    {
      'text': 'Music Therapy',
      'imagePath': 'assets/podcasts_stories.png',
      'routes': MusicTherapy.routeName
    },
    {
      'text': 'Worry List',
      'imagePath': 'assets/worry_list.png',
      'routes': Worrylist.routeName
    },
    {
      'text': 'Logout',
      'imagePath': 'assets/logout.png',
      'onClick': (BuildContext context) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
      },
      'routes': ''
      // Please leave it blank!
    }
  ];
  @override
  void navigate(BuildContext context, int index) {
    Navigator.of(context).pushNamed(items[index]['routes'].toString());
  }

  Widget menuItem(int index, BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return GestureDetector(
        child: Menu(
          text: items[index]['text'],
          imagePath: items[index]['imagePath'],
        ),
        onTap: () => items[index]['routes'] == ''
            ? items[index]['onClick'](context)
            : navigate(context, index),
      );
    } else {
      if (items[index]['text'] != 'Logout') {
        return GestureDetector(
          child: Menu(
            text: items[index]['text'],
            imagePath: items[index]['imagePath'],
          ),
          onTap: () => navigate(context, index),
        );
      } else {
        return GestureDetector(
          child: const Menu(
            text: 'Login/Signup',
            imagePath: 'assets/login_menu.png',
          ),
          onTap: () {
            Navigator.of(context).pushNamed(SplashScreen.routeName);
          },
        );
      }
    }
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
              return menuItem(index, context);
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

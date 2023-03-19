import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import './menu.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: Center(
              child: Text(
                "More Features",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Menu(
                  text: "Test My Bedroom",
                  imagePath: 'images/test_my_environment.png'),
              Menu(text: "Phone-Free time", imagePath: 'images/phone_free.png')
            ],
          ),
          SizedBox(height: 20, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Menu(
                  text: "Meditation Timer",
                  imagePath: 'images/meditation_timer.png'),
              Menu(
                  text: "Listen to your stories",
                  imagePath: 'images/nap_timer.png')
            ],
          ),
          SizedBox(height: 20, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Menu(
                  text: "Sleep Cycle Calculator",
                  imagePath: 'images/sleep_cycle_calculator.png'),
              Menu(
                  text: "Sleep Diet Suggestions",
                  imagePath: 'images/sleep_diet.png')
            ],
          ),
          SizedBox(height: 20, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Menu(
                  text: "Mental Exercises",
                  imagePath: 'images/mental_exercises.png'),
              Menu(
                  text: "Sleep Achievement",
                  imagePath: 'images/sleep_achievement.png')
            ],
          ),
          SizedBox(height: 20, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Menu(
                  text: "Music Therapy",
                  imagePath: 'images/podcasts_stories.png'),
              Menu(text: "Worry List", imagePath: 'images/worry_list.png')
            ],
          ),
        ],
      ),
    );
  }
}

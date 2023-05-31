import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/SleepinessCalculator/sleepModal.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Sleepiness extends StatefulWidget {
  const Sleepiness({Key? key}) : super(key: key);
  static const routeName = 'menu/sleepiness';

  @override
  _SleepinessState createState() => _SleepinessState();
}

class _SleepinessState extends State<Sleepiness> {
  final List<dynamic> _questions = [
    'Sitting and reading',
    'Watching TV',
    'Sitting inactive in a public place (e.g. cinema or in a meeting)',
    'Being in a car for an hour as a passenger (without a break)',
    'Lying down to rest in the afternoon (when possible)',
    'Sitting and chatting to someone',
    'Sitting quietly after lunch (not having had alcohol)',
    'In a car when you stop in traffic for a few minutes'
  ];
  final List<dynamic> _options = [
    'Would never doze',
    'Slight chance of dozing',
    'Moderate chance of dozing',
    'High chance of dozing'
  ];
  final List<Map<String, dynamic>> _solutions = [
    {
      'heading': 'You are most likely getting enough sleep',
      'subheading':
          "However, if you have noticed a change in your normal sleep routine, do add in your sleep tracker.",
      'image': 'https://i.ibb.co/Yd10rfY/articles-sleep-disorder.png'
    },
    {
      'heading': 'Your may be suffering from excessive daytime sleepiness',
      'subheading':
          'Please fill out the plan form, or ask a sleep trainer for help.',
      'image': 'https://i.ibb.co/Yd10rfY/articles-sleep-disorder.png'
    },
    {
      'heading': 'You are dangerously sleepy',
      'subheading':
          'Please signup to our Plan to improve your conditions and track sleep. You can schedule an appointment too.',
      'image': 'https://i.ibb.co/ZYX6VNy/articles-sleep-issues.png'
    }
  ];
  final List<int?> _answerList = [0, 0, 0, 0, 0, 0, 0, 0];

  int? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
            profile: false,
          ),
          HomeScreenText(
            text: 'Epworth Calculator',
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'The Epworth Sleepiness Scale is a questionnaire to measure daytime sleepiness.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._questions.mapIndexed((indi, value) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 17),
                      ),
                      DropdownButton(
                        items: [
                          ..._options.mapIndexed((index, opt) {
                            return DropdownMenuItem(
                              key: UniqueKey(),
                              value: index,
                              child: Text(opt),
                            );
                          })
                        ],
                        onChanged: (value) {
                          setState(() {
                            _answerList[indi] = value;
                          });
                        },
                        key: UniqueKey(),
                        value: _answerList[indi],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                })
              ],
            ),
          ),
          ElevatedButtonWithoutIcon(
            text: 'Calculate',
            onPressedButton: () {
              int? score = 0;

              for (int i = 0; i < _answerList.length; i++) {
                score = score! + _answerList[i]!.toInt();
              }

              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  if (score! <= 10) {
                    return SleepModal(data: _solutions[0]);
                  } else if (score <= 15) {
                    return SleepModal(data: _solutions[1]);
                  }

                  return SleepModal(data: _solutions[2]);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

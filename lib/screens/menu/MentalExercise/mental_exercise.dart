import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise_solutions.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MentalExercise extends StatelessWidget {
  List<Map<String, String>> options = [
    {
      'title': 'Visualization',
      'subtitle':
          'Involves creating a mental image or scenario that is soothing, calming, and peaceful',
      "image": 'assets/visualization.png',
    },
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle': 'It makes user more aware of areas of tension in their body',
      "image": 'assets/relaxation.png',
    },
    {
      'title': 'Meditation',
      'subtitle':
          'Mental practice that involves focusing the mind on a particular object',
      "image": 'assets/meditation.png',
    },
    {
      'title': 'Autogenic Relaxation',
      'subtitle':
          'Using self-suggestion to create a sense of relaxation and well-being in the body',
      "image": 'assets/autogenic_relaxation.png',
    },
    {
      'title': 'Deep Breathing',
      'subtitle':
          'Relaxation technique that involves taking slow, deep breaths',
      "image": 'assets/deep_breathing.png',
    },
  ];
  static String routeName = '/mental-exercise';
  @override
  Widget build(BuildContext context) {
    var widthi = MediaQuery.of(context).size.width;
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
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          MentalExerciseSolution.routeName,
                          arguments: card['title'],
                        ).then((value) {
                          dynamic player = Provider.of<AudioProvider>(context,listen: false);
                          if(player.duration.inMilliseconds > 0){
                            player.release();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )),
                        width: double.infinity,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              width: widthi * 0.5,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card['title'].toString(),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    card['subtitle'].toString(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Image.asset(card['image'].toString())),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(
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

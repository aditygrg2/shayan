import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/mental_solution_provider.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import './audio_player.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MentalExerciseSolution extends StatelessWidget {
  static String routeName = '/mental-exercise-solution';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final solution = Provider.of<MentalSolutionProvider>(context)
        .getSolution(args as String);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          alignment: Alignment.center,
                          child: Text(
                            args.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            solution['subtitle'],
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          height: 250,
                          child: ImageCacher(
                            imagePath: solution['image'],
                            fit: BoxFit.contain,
                            isCanvas: true,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Text(
                            solution['description'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...(solution['tips'] as List).map((element) {
                          return ListTile(
                            leading: Container(width: 40,height: 40,child: Image.asset('assets/check-mark.png',fit: BoxFit.cover,)),
                            subtitle: Text(element),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  AudioPlayerWithSlider(solution['audio'],true),
                ],
              )),
        ],
      ),
    );
  }
}

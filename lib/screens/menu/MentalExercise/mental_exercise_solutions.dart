import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/mental_solution_provider.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/audio_player.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MentalExerciseSolution extends StatelessWidget {
  static String routeName = '/mental-exercise-solution';
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)?.settings.arguments;

    final solution =
        Provider.of<MentalSolutionProvider>(context).getSolution(args as String);
    // get title  from routes
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 227, 221, 1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          alignment: Alignment.center,
                          child: Text(
                            args.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            solution['subtitle'],
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          height: 300,
                          child: Image.asset(
                            solution['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Text(
                            solution['description'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ...(solution['tips'] as List).map((element) {
                          return ListTile(
                            leading: Image.asset('assets/check-mark.png'),
                            subtitle: Text(element),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  AudioPlayerWithSlider(solution['audio']),
                ],
              )),
        ],
      ),
    );
  }
}

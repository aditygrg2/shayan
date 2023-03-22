import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/audio_player.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MentalExerciseSolution extends StatelessWidget {

  static String routeName = '/mental-exercise-solution';

  @override
  Widget build(BuildContext context) {
    // get data from routes
    return Scaffold(
      body: ListView(
        children: [
          TopRow(back: true,),
          Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(child: Text('Progressive Muscle Exercise',),),
                    Container(child: Text('In this relaxation technique',),),
                    Container(child: Image.network(''),),
                  ],
                ),
              ),
              AudioPlayerWithSlider(),
            ],
          )
          ),
        ],
      ),
    );
  }
}
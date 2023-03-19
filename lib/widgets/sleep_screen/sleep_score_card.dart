import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';

class SleepScoreCard extends StatelessWidget {
  final String? text;
  final int? sleepscore;

  SleepScoreCard(
      {this.text =
          "To maintain optimal performance, you may require more rest", this.sleepscore = 89});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: (width - 20) * 0.70,
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).canvasColor,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(sleepscore.toString(), style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                ),
                Expanded(
                  child: Text(text!),
                )
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/kid.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
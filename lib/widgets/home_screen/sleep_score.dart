import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/widgets/UI/block_cards.dart';

class SleepScore extends StatefulWidget {
  int? sleepscore;

  SleepScore({this.sleepscore = 50});

  @override
  State<SleepScore> createState() => _SleepScoreState();
}

class _SleepScoreState extends State<SleepScore> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return BlockCards(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      backgroundColor: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            DateFormat('EEEEE, MMMM d', 'en_US').format(DateTime.now()),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 10.0,
              percent: (widget.sleepscore! / 100),
              center: Text(
                widget.sleepscore!.round().toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              linearGradient: LinearGradient(
                colors: [
                  Theme.of(context).canvasColor,
                  Theme.of(context).primaryColor,
                ],
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SleepForm.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Tell us about last night!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}

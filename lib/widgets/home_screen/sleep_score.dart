import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/widgets/UI/block_cards.dart';

class SleepScore extends StatefulWidget {
  double? sleepscore;

  SleepScore({this.sleepscore = 50.0});

  @override
  State<SleepScore> createState() => _SleepScoreState();
}

class _SleepScoreState extends State<SleepScore> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return BlockCards(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
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
              progressColor: Colors.green,
            ),
          ),
          ElevatedButton(
            onPressed: null,
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

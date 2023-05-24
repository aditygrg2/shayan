import 'package:flutter/material.dart';

class SleepScoreCard extends StatelessWidget {
  final String? text;
  final int? sleepscore;

  SleepScoreCard({
    this.text = "To maintain optimal performance, you may require more rest",
    this.sleepscore = 89,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: (width - 20) * 0.70,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).canvasColor,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      color: Theme.of(context).dividerColor,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      sleepscore.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
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

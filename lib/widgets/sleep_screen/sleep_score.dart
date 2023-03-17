import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/sleep_screen/score_card.dart';

class SleepScore extends StatelessWidget {
  const SleepScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeScreenText('Sleep Score'),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScoreCard(),
                Container(width: (MediaQuery.of(context).size.width - 40)*0.32,child: Image.network("https://i.ibb.co/W30txZS/10701320-43710-removebg-preview-1.png",fit: BoxFit.cover,))
              ],
            ),
          )

        ],
      ),
    );
  }
}

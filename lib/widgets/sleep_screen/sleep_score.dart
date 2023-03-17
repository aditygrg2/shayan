import 'package:flutter/material.dart';
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
          Container(child: Text('Sleep Score',style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.left,)),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 108,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScoreCard(),
                Container(child: Image.network("https://i.ibb.co/W30txZS/10701320-43710-removebg-preview-1.png",fit: BoxFit.fill,))
              ],
            ),
          )

        ],
      ),
    );
  }
}

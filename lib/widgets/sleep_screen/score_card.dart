import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScoreCard extends StatelessWidget {
  int score = 82;
  String suggestion =
      "to maintain optimal performance, you may require more rest";
  ScoreCard({this.score = 82});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160,
      decoration: BoxDecoration(
          color: Color.fromRGBO(143, 227, 221, 1),
          borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black)),
      padding: EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: (MediaQuery.of(context).size.width-195)*0.35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(200)),
            child: Text(score.toString(),style: Theme.of(context).textTheme.headlineLarge,),
          ),
          SizedBox(width: 15,),
          Container(
            width: (MediaQuery.of(context).size.width-195)*0.65,
            height: 80,
            alignment: Alignment.center,
            child: Flexible(
                child: Text(
              suggestion,
              style: Theme.of(context).textTheme.bodySmall,
            )),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_report.dart';
import '../../widgets/sleep_screen/sleep_score.dart';

class MySleepScreen extends StatelessWidget {
  static const routeName = '/mySleep';
  
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SleepScore(),
        Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            
            spacing: 20,
            runSpacing:12 ,
            children: [
              PropertyCard(width: 140 ,height: 140,),
              PropertyCard(width: 140 ,height: 140,),
              PropertyCard(width: 140 ,height: 140,),
              PropertyCard(width: 140 ,height: 140,),
            ],
          ),
        ),
        MySleepReport()

    
      ],
    );
  }
}
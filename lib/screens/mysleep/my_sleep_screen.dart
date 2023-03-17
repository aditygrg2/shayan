import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import '../../widgets/sleep_screen/sleep_score.dart';

class MySleepScreen extends StatelessWidget {
  static const routeName = '/mySleep';
  
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SleepScore(),
        Container(
          child: Wrap(
            
            spacing: 12,
            runSpacing:12 ,
            children: [
              PropertyCard(width: 170 ,height: 140,),
              PropertyCard(width: 170 ,height: 140,),
              PropertyCard(width: 170 ,height: 140,),
              PropertyCard(width: 170 ,height: 140,),
            ],
          ),
        )

    
      ],
    );
  }
}
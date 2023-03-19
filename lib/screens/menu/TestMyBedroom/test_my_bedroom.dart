import 'dart:math';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Noisepollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/light_pollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/temperature.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/tmb_description_cards.dart';

class TestMyBedroom extends StatefulWidget {

  @override
  State<TestMyBedroom> createState() => _TestMyBedroomState();
}

class _TestMyBedroomState extends State<TestMyBedroom> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenText(text: 'Test My Bedroom'),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'We all need the perfect environment for sleep, light, noise and temperature are key elements in making your bedroom a relaxed and peaceful zone, perfectly suited for sleep',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Create your ideal sleep environment',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TmbDescriptionCards(title: 'Light Pollution', subtitle: 'Restricts the naturally timed rise of melatonin and delays the body\'s transition to sleep',image: 'assets/light.png',route: LightPollution.routeName),
        TmbDescriptionCards(title: 'Noise Pollution', subtitle: 'Restricts the naturally timed rise of melatonin and delays the body\'s transition to sleep',image: 'assets/noise.png', route: NoisePollution.routeName,),
        TmbDescriptionCards(title: 'Temperature Check', subtitle: 'Restricts the naturally timed rise of melatonin and delays the body\'s transition to sleep',image: 'assets/temperature.png',route: Temperature.routeName,)
      ],
    );
  }
}

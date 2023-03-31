import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_view_all.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:provider/provider.dart';

class WhatsNew extends StatefulWidget {
  int cardLimit = 3;
  List<Map<String, String>> items = [
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
    {
      'title': 'Amazing food',
      'description': 'Eat food that helps you get good and nourishing sleep',
      'imageURL':
          'https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg'
    },
  ];

  List<Map<String, String>> get itemsList {
    if (cardLimit == 3) {
      return items.getRange(0, 3).toList();
    }
    return items.toList();
  }

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    int? tst = Provider.of<SleepElements>(context, listen: false).TST;
    int? SE = Provider.of<SleepElements>(context, listen: false).SE;
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Column(
        children: [
          HomeScreenText(text: 'Sleep Elements'),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 10),
                child: PropertyCard(
                  color: Theme.of(context).splashColor,
                  score: tst == null ? 'Data not available' : tst.toString(),
                  title: 'Total Sleep Time',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 10),
                child: PropertyCard(
                  color: Theme.of(context).splashColor,
                  score: SE == null ? 'Data not available' : SE.toString(),
                  title: 'Sleep Efficiency',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Check out more details on My Sleep Page',
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

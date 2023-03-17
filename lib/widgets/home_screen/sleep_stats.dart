import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_view_all.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 15),
      child: Column(
        children: [
          HomeScreenText('Your Sleep Stats'),
          SizedBox(
            height: 10,
          ),
          HomeScreenViewAll(),
          Column(
            children: widget.itemsList.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(250, 195, 68, 1),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  // mouseCursor: MouseCursor.defer,
                  title: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(item['title'].toString())),
                  subtitle: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(item['description'].toString())),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Image.network(
                      "https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg",
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

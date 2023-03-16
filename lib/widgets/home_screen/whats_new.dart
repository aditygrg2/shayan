import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_view_all.dart';

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
      child: Column(
        children: [
          HomeScreenText('Your Sleep Stats'),
          HomeScreenViewAll(),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10),
            physics: ClampingScrollPhysics(),
            children: widget.itemsList.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color.fromARGB(240, 249, 249, 248))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(164, 255, 255, 255)),
                child: ListTile(
                  // mouseCursor: MouseCursor.defer,
                  title: Text(item['title'].toString()),
                  subtitle: Text(item['description'].toString()),
                  trailing: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(19)),
                    child: Image.network(
                      "https://i.ibb.co/XpHKstd/Whats-App-Image-2023-03-15-at-22-35-12.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
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
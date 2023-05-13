import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/article.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ArticlesScreen extends StatelessWidget {
  static String routeName = '/articles';
  List<Map<dynamic, dynamic>> articles = [
    {
      "title": "Sleep Deprivation",
      "image": "assets/article_1.jpg",
      "description":
          "Many people do not get enough quality sleep, and this can affect their health, well-being, and ability to do everyday activities.Many people do not get enough quality sleep, and this can affect their health, well-being, and ability to do everyday activities"
    },
    {
      "title": "Sleep Disorders And Problems",
      "image": "assets/article_2.jpg",
      "description":
          "A sleep disorder is a condition that frequently impacts your ability to get enough quality sleep. Many of us occasionally experience difficulties sleeping..."
    },
    {
      "title": "How to fix Sleep Problems",
      "image": "assets/article_3.jpg",
      "description":
          "Each year, there are more than 40 million people in North America who suffer from sleeping disorders. An additional 20 million have occasional sleeping problems..."
    },
    {
      "title": "Eating for Sleep: The Anti-Insomnia Diet",
      "image": "assets/article_4.jpg",
      "description":
          "The food you eat does more than simply sustain you. The nutrients you consume play a vital role in the chemical reactions of each and every bodily function... "
    },
    {
      "title": "The Best Exercises for Sleep",
      "image": "assets/article_5.jpg",
      "description":
          "The link between regular exercise and sleep quality has been studied extensively. Current research strongly suggests exercise and sleep share a bidirectional relationship ... "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Articles",
          ),
          ...articles.map((e) {
            return Container(
                padding: EdgeInsets.all(10),
                child: Article(
                    image: e['image'],
                    name: e['title'],
                    description: e['description']));
          }).toList()
        ],
      ),
    );
  }
}

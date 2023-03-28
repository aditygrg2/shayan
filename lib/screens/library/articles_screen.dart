import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/library/article.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class ArticlesScreen extends StatelessWidget {
  static String routeName='/articles';
  List<Map<dynamic,dynamic>>articles=[
    {
      "title":"Sleep Issues",
      "image":"assets/articles_sleep_issues.png",
      "description":"Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... "
    },
    {
      "title":"Sleep Issues",
      "image":"assets/articles_sleep_issues.png",
      "description":"Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... "
    },
    {
      "title":"Sleep Issues",
      "image":"assets/articles_sleep_issues.png",
      "description":"Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... "
    },
    {
      "title":"Sleep Issues",
      "image":"assets/articles_sleep_issues.png",
      "description":"Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... "
    },
    {
      "title":"Sleep Disorders",
      "image":"assets/articles_sleep_disorder.png",
      "description":"Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(back: true,),
          HomeScreenText(text: "Articles",),
          ...articles.map((e) {
            return Container(padding: EdgeInsets.all(10),child: Article(image: e['image'], name: e['title'], description: e['description']));
          }).toList()
        ],
      ),
    );
  }
}
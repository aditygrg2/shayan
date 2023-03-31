import 'package:flutter/material.dart';

class CommunityPostPRovider extends ChangeNotifier{
  List<Map<dynamic, dynamic>> posts = [
    {
      "title": "Sleep Issues",
      "image": "assets/articles_sleep_issues.png",
      "description":
          "Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... ",
      "user":"Ronaldo",
      "type":"artcle"
    },
    {
      "title": "Sleep Issues",
      "image": "assets/articles_sleep_issues.png",
      "description":
          "Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... ",
           "user":"Ronaldo",
      "type":"Podcast"
    },
    {
      "title": "Sleep Issues",
      "image": "assets/articles_sleep_issues.png",
      "description":
          "Common sleep disorders like insomnia, restless legs syndrome, narcolepsy and sleep apnea can affect every aspect of your life including your safety, relationships, school and work performance... ",
           "user":"Ronaldo",
      "type":"artcle"
    },
  ];

  List<dynamic> get getPosts{
    return [...posts];
  }
}
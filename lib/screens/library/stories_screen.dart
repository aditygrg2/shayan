import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/music_category_component.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class StoryScreen extends StatelessWidget {
  static String routeName = '/story-screen';

  List<Map<dynamic, dynamic>> categories = [
    {
      'title': "Kids",
      "data": [
        {
          "image": "assets/sleep_story_1.jpg",
          "title": "Bedtime Stories",
          "description":
              "Healing Rays of the Sun come to the earth giving a life to the nature and a source of hope..."
        },
        {
          "image": "assets/sleep_story_2.jpg",
          "title": "Magic Unicorn",
          "description":
              "Child clinicians point out the cognitive benefits for youths who are raised with bedtime stories."
        },
        {
          "image": "assets/sleep_story_3.jpg",
          "title": "Castle on the ocean",
          "description":
              "An enchanting sleep meditation for kids to relax and love falling asleep at the magic castle each new bedtime"
        },
      ]
    },
    {
      'title': "Adults",
      "data": [
        {
          "image": "assets/sleep_story_4.jpg",
          "title": "The Adventures of SherLock Holmes",
          "description":
              "Shelock Holmes, possibly one of the world's most well known detectives, has been absorbed by almost every time of media platform..."
        },
        {
          "image": "assets/sleep_story_5.jpg",
          "title": "The Gift of the Magi",
          "description":
              "The magi brought valuable gifts, but that was not among them. My meaning will be explained soon. From inside the coat..."
        },
        {
          "image": "assets/sleep_story_6.jpg",
          "title": "The Cabin in the Woods",
          "description":
              "'The Cabin in the Woods' Beomes a Horror Movie About Horror Movies ... As chaos ensues and various workers are ironically dispatched by the ..."
        }
      ]
    },
  ];
  final _musicData = [
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':
          'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':
          'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':
          'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':
          'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
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
            text: "Story",
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(10),
            child: Image.asset("assets/story_library.jpg", fit: BoxFit.contain),
          ),
          ...categories.map((e) {
            return MusicCategory(
              data: e['data'],
              title: e['title'],
            );
          }).toList()
        ],
      ),
    );
  }
}

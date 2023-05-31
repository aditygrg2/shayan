import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/music_category_component.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
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
          "description": "Healing Rays of the Sun..."
        },
        {
          "image": "assets/sleep_story_3.jpg",
          "title": "Castle on the ocean",
          "description": "An enchanting sleep meditation..."
        },
        {
          "image": "assets/sleep_story_2.jpg",
          "title": "Magic Unicorn",
          "description": "Child clinicians point out the cognitive benefits..."
        },
        {
          "image": "assets/sleep_story_9.jpg",
          "title": "Goldilocks and the three bears",
          "description": "Once upon a time there were three bears who lived..."
        },
        {
          "image": "assets/sleep_story_10.jpg",
          "title": "Aladdin And the Magic Lamp",
          "description":
              "As a last goodbye to their life on the camel train, Aladdin..."
        }
      ]
    },
    {
      'title': "Adults",
      "data": [
        {
          "image": "assets/sleep_story_6.jpg",
          "title": "The Cabin in the Woods",
          "description": "A Horror Movie About Horror Movies..."
        },
        {
          "image": "assets/sleep_story_5.jpg",
          "title": "The Gift of the Magi",
          "description": "The magi brought valuable gifts..."
        },
        {
          "image": "assets/sleep_story_4.jpg",
          "title": "The Adventures of SherLock Holmes",
          "description": "World's most well known detectives..."
        },
        {
          "image": "assets/sleep_story_7.png",
          "title": "Karma",
          "description": "The relationship between a person's mental..."
        },
        {
          "image": "assets/sleep_story_8.png",
          "title": "The midnight library",
          "description": "Between life and death there is a library..."
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
            text: "Stories",
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(10),
            child: ImageCacher(
              imagePath: "https://i.ibb.co/mCRrTQL/story-library.jpg",
              fit: BoxFit.contain,
            ),
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

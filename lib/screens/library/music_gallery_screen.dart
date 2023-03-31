import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/music_category_component.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MusicGalleryScreen extends StatelessWidget {
  static String routeName = '/music-gallery';

  List<Map<dynamic, dynamic>> categories = [
    {
      'title': "Meditative Mantras",
      "data": [
        {
          "image": "assets/mantra_1.jpg",
          "title": "Om Shanti, Shanti, Shanti",
          "description": "Peace of mind, body, and speech."
        },
        {
          "image": "assets/mantra_2.jpg",
          "title": "I am That I Am",
          "description":
              "This is one of the Hebrew Torah's most famous lines, and it was God's answer to Moses when Moses asked for his name."
        },
        {
          "image": "assets/mantra_3.jpg",
          "title": "I Love You; I'm Sorry; Please Forgive Me; Thank You",
          "description":
              "Forgiveness and reconciliation practice, cleansing of 'errors of thought'-the origin of problems and sickness in the physical world"
        },
      ]
    },
    {
      'title': "Sounds",
      "data": [
        {
          "image": "assets/music_sounds.jpg",
          "title": "Peaceful Night",
          "description": "Deep Sleep Relaxation Sounds"
        },
        {
          "image": "assets/beach_sounds.jpg",
          "title": "Beach Sounds",
          "description": "Ocean Waves Noise for Deep sleep"
        },
      ]
    },
    {
      'title': "Calming Tunes",
      "data": [
        {
          "image": "assets/calming_tone1.jpg",
          "title": "Moon",
          "description": "Full Moon Calming Music"
        },
        {
          "image": "assets/calming_tone2.jpg",
          "title": "Waterfall",
          "description": "Relaxing Music Sleep Waterfall"
        },
      ]
    },
  ];
  final _musicData = [
    {
      'heading': 'Fantasy',
      'subHeading': 'Imagine yourself in a world of peace.',
      'src': 'assets/music_data_1.jpeg',
    },
    {
      'heading': 'Nature',
      'subHeading': 'Getting closed with nature',
      'src': 'assets/music_data_2.jpg',
    },
    {
      'heading': 'Village Life',
      'subHeading': 'A day of the life at village.',
      'src': 'assets/music_data_3.jpg',
    },
    {
      'heading': 'Good morning',
      'subHeading': 'Peaceful Morning with a cup of coffee',
      'src': 'assets/music_data_4.jpg',
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
            text: "Music",
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(10),
            child: Image.asset("assets/library_music_categories_page.png",
                fit: BoxFit.contain),
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

import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_short.dart';
import 'package:night_gschallenge/widgets/UI/sliding/sliding_card_rounded.dart';

class MusicSection extends StatefulWidget {
  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {

  final _musicData = [
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          HomeScreenText('Music Therapy'),
          HomeScreenShort(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ..._musicData.map((item) => SlidingCardRounded(heading: item['heading'],subHeading: item['subHeading'],src: item['src'])).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

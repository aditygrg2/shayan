import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/sliding_card_rounded.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Podcast extends StatelessWidget {
  static String routeName = "/podcast";
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
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':
          'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
    },
    {
      'heading': 'River Flow',
      'subHeading': 'calm, soothing music',
      'src':'https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg',
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
            text: "Podcasts",
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2 / 2,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: (){
                      Navigator.of(context).pushNamed(PodcastScreenPlay.routeName);
                    },child: LibraryCard(heading: _musicData[index]['heading'],src: _musicData[index]['src'],subHeading: _musicData[index]['subHeading']));
                  },
                  itemCount: _musicData.length,),
          ),
        ],
      ),
    );
  }
}


// SlidingCardRounded(heading: _musicData[index]['heading'],src: _musicData[index]['src'],subHeading: _musicData[index]['subHeading']);
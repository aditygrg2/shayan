import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Podcast extends StatelessWidget {
  static String routeName = "/podcast";
  final _musicData = [
    {
      'heading': 'Get Sleepy',
      'subHeading': 'Want to hear a story to get Sleepy?Use GetSleepy.',
      'src': 'https://getsleepy.simplecast.com/',
    },
    {
      'heading': 'Sleep With Me',
      'subHeading':
          'Insomnia? Can\'t fall asleep? Mind racing at night? Worries keeping you awake? Watch this podcast and see the results.',
      'src': 'https://soundcloud.com/sleepwithmepodcast',
    },
    {
      'heading': 'Sleep Meditation Podcast',
      'subHeading': 'Hear Relaxing Sleep Sounds To improve your sleep.',
      'src': 'https://open.spotify.com/show/0OqwG23cqvPundxNPArv5Z',
    },
    {
      'heading': 'The Infinite Monkey Cage',
      'subHeading': 'Get a deep knowledge about insomnia and sleep sciene.',
      'src': 'https://www.bbc.co.uk/programmes/b07knqxy',
    },
    {
      'heading': 'Slow Radio',
      'subHeading':
          'Want to fall in love with nature along with improved sleep quality? Slow Radio is best for you.',
      'src': 'https://www.bbc.co.uk/programmes/p05k5bq0/episodes/downloads',
    },
    {
      'heading': 'Tracks to Relax',
      'subHeading': 'Watch weekly Guided Meditations for napping and sleeping.',
      'src':
          'https://open.spotify.com/show/75BvaaxemjYBSLP03xpm3m?si=8fpsmnAYRQyEjRtO68Z5mA&nd=1',
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
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 2,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(PodcastScreenPlay.routeName);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      child: LibraryCard(
                          heading: _musicData[index]['heading'],
                          src: _musicData[index]['src'],
                          subHeading: _musicData[index]['subHeading']),
                    ));
              },
              itemCount: _musicData.length,
            ),
          ),
        ],
      ),
    );
  }
}


// SlidingCardRounded(heading: _musicData[index]['heading'],src: _musicData[index]['src'],subHeading: _musicData[index]['subHeading']);
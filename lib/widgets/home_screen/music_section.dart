import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/music_provider.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_view_all.dart';
import 'package:night_gschallenge/widgets/UI/sliding_card_rounded.dart';
import 'package:provider/provider.dart';

class MusicSection extends StatefulWidget {
  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {
  
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context,listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          HomeScreenText(text: 'Relax your Mood'),
          HomeScreenViewAll(
            onClick: () {
              Navigator.of(context).pushNamed(MusicGalleryScreen.routeName);
            },
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 370,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...musicProvider.getMusic
                    .map(
                      (item) => SlidingCardRounded(
                        heading: item['heading'],
                        subHeading: item['subHeading'],
                        src: item['src'],
                      ),
                    )
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

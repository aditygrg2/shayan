import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_view_all.dart';
import 'package:night_gschallenge/widgets/UI/sliding_card_rounded.dart';

class MusicSection extends StatefulWidget {
  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {
  final _musicData = [
    {
      'heading': 'Foods Improving Insomnia',
      'subHeading':
          'Warm milk is a common home remedy for sleeplessness. Milk contains four sleep-promoting compounds: tryptophan, calcium, vitamin D, and melatonin ...',
      'src': 'assets/home_image_1.jpg',
    },
    {
      'heading': 'Sleep Hyigene',
      'subHeading':
          'Make sure your bedroom is quiet, dark, relaxing, and at a comfortable temperature. Remove electronic devices, such as TVs, computers, and smart phones...',
      'src': 'assets/home_image_2.jpg',
    },
    {
      'heading': 'Nature Scenes',
      'subHeading':
          'Nature is the best medicine of any illness especially when it comes to anxiety, sleep deprivation, mental issues...',
      'src': 'assets/home_image_3.jpg',
    },
    {
      'heading': 'Getting Better Sleep',
      'subHeading':
          'Do you wake up feeling exhausted even though you went to bed at a decent time and tried to get enough sleep?..',
      'src': 'assets/home_image_4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          HomeScreenText(text: 'Music Therapy'),
          HomeScreenViewAll(
            onClick: () {
              Navigator.of(context).pushNamed(MusicGalleryScreen.routeName);
            },
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ..._musicData
                    .map((item) => SlidingCardRounded(
                        heading: item['heading'],
                        subHeading: item['subHeading'],
                        src: item['src']))
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

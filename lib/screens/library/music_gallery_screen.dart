import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/music_provider.dart';
import 'package:night_gschallenge/screens/library/music_category_component.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MusicGalleryScreen extends StatelessWidget {
  static String routeName = '/music-gallery';
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
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
            child: ImageCacher(
              imagePath:
                  "https://i.ibb.co/J3fKWZR/library-music-categories-page.png",
              fit: BoxFit.contain,
            ),
          ),
          ...musicProvider.getCategory.map((e) {
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

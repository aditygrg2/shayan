import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/library/podcast.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/tmb_description_cards.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Map<dynamic,dynamic>>libraryCards=[
    {
      "title":"Podcasts",
      "subtitle":"focus on distracting a racing mind, creating a better night time routine and masking external disturbances",
      "image":"assets/library_podcast.png",
      "route":Podcast.routeName,
    },
    {
      "title":"Articles",
      "subtitle":"focus on distracting a racing mind, creating a better night time routine and masking external disturbances",
      "image":"assets/library_articles.png",
      "route":ArticlesScreen.routeName,
    },
    {
      "title":"Stories",
      "subtitle":"focus on distracting a racing mind, creating a better night time routine and masking external disturbances",
      "image":"assets/library_stories.png",
      "route":"",
    },
    {
      "title":"Music",
      "subtitle":"focus on distracting a racing mind, creating a better night time routine and masking external disturbances",
      "image":"assets/library_music.png",
      "route":"",
    },
    {
      "title":"Community",
      "subtitle":"focus on distracting a racing mind, creating a better night time routine and masking external disturbances",
      "image":"assets/library_community.png",
      "route":"",
    },
  ];
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
          HomeScreenText(text: "Library",),
          ...libraryCards.map((ele){
            return TmbDescriptionCards(title: ele['title'],subtitle: ele['subtitle'],image: ele['image'],route: ele['route']);
          }).toList(),
        ],
    );
  }
}
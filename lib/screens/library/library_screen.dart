import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/library/community_screen.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/screens/library/podcast.dart';
import 'package:night_gschallenge/screens/library/stories_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/tmb_description_cards.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Map<dynamic, dynamic>> libraryCards = [
    {
      "title": "Podcasts",
      "subtitle":
          "Discover soothing podcasts that help you unwind, relax, and find peace before drifting off to sleep.",
      "image": "assets/library_podcast.png",
      "route": Podcast.routeName,
    },
    {
      "title": "Articles",
      "subtitle":
          "Explore a collection of insightful articles that explore the science of sleep, dream interpretation, and tips for a restful night.",
      "image": "assets/library_articles.png",
      "route": ArticlesScreen.routeName,
    },
    {
      "title": "Stories",
      "subtitle":
          "Indulge in captivating stories that transport you to tranquil realms, lulling your mind into a state of serenity for a peaceful slumber.",
      "image": "assets/library_stories.png",
      "route": StoryScreen.routeName,
    },
    {
      "title": "Music",
      "subtitle":
          "Immerse yourself in a harmonious selection of ambient music designed to accompany your sleep journey and promote deep relaxation.",
      "image": "assets/library_music.png",
      "route": MusicGalleryScreen.routeName,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenText(
          text: "Library",
        ),
        ...libraryCards.map((ele) {
          return TmbDescriptionCards(
            title: ele['title'],
            subtitle: ele['subtitle'],
            image: ele['image'],
            route: ele['route'],
          );
        }).toList(),
      ],
    );
  }
}

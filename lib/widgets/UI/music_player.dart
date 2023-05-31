import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/favourite_bar.dart';
import './playlist_player.dart';

class MusicPlayer extends StatelessWidget {
  static String routeName = '/music-player';
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final playlist = arguments['playlist'] as List<dynamic>;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Column(
          children: [
            FavouriteBar(),
            PlayListPlayer(
              playlist: playlist,
              index: arguments['index'],
            ),
          ],
        ),
      ),
    );
  }
}

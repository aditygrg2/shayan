import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/favourite_bar.dart';
import './playlist_player.dart';

class MusicPlayer extends StatelessWidget {
  static String routeName = '/music-player';
  @override
  Widget build(BuildContext context) {
    final playlist =
        ModalRoute.of(context)?.settings.arguments as List<Map<String, String>>;
        print(playlist);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey,
            Colors.black,
          ],
        )),
        child: Column(
          children: [
            FavouriteBar(), 
            PlayListPlayer(playlist),
           
          ],
        ),
      ),
    );
  }
}

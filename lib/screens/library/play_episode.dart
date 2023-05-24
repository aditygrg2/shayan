import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/UI/music_player.dart';
class PlayEpisode extends StatefulWidget {
  int index;
  String episodeName = "Something happened";
  String description = "Sorry for inconvenience.";
  List<dynamic> episodes;

  PlayEpisode({
    required this.episodeName,
    required this.description,
    required this.index,
    required this.episodes,
  });
  @override
  State<PlayEpisode> createState() => _PlayEpisodeState();
}

class _PlayEpisodeState extends State<PlayEpisode> {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      "Episode ${widget.index+1}. ${widget.episodeName}",
                      style:
                          const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ))),
            Container(
                padding: const EdgeInsets.all(7),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MusicPlayer.routeName,arguments: {'playlist':widget.episodes,'index':widget.index});
                  },
                  icon: Icon(
                       Icons.play_arrow_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: 32),
                )),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(7),
          child: Text(
            widget.description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(8),
          height: 1,
          width: double.infinity,
          child: Text(''),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
      ],
    );
  }
}

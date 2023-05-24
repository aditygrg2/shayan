import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/audio_player.dart';
import 'package:provider/provider.dart';

class PlayEpisode extends StatefulWidget {
  String index;
  String episodeName = "Something happened";
  String description = "Sorry for inconvenience.";
  String episode;
  bool isPlaying = false;
  PlayEpisode({
    required this.episodeName,
    required this.description,
    required this.index,
    required this.episode,
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
                      "Episode ${widget.index}. ${widget.episodeName}",
                      style:
                          const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ))),
            Container(
                padding: const EdgeInsets.all(7),
                child: IconButton(
                  onPressed: () {
                    if (widget.isPlaying) {
                      audioProvider.pause();
                      setState(() {
                        widget.isPlaying = false;
                      });
                    } else {
                      setState(() {
                        widget.isPlaying = true;
                      });
                      audioProvider.load(widget.episode);
                      audioProvider.play();
                    }
                  },
                  icon: Icon(
                      widget.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: 32),
                )),
          ],
        ),
        Container(
          padding: EdgeInsets.all(7),
          child: Text(
            widget.description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (widget.isPlaying) AudioPlayerWithSlider(widget.episode, false),
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

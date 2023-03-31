import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:provider/provider.dart';

class AudioPlayerWithSlider extends StatefulWidget {
  bool isPlaying = false;
  String audio;
  Duration progress = const Duration();
  AudioPlayerWithSlider(this.audio);
  @override
  State<AudioPlayerWithSlider> createState() => _AudioPlayerWithSliderState();
}

class _AudioPlayerWithSliderState extends State<AudioPlayerWithSlider> {
  void handlePlay(AudioProvider audioProvider) {
    setState(() {
      if (widget.isPlaying) {
        audioProvider.pause();
        widget.isPlaying = !widget.isPlaying;
      } else {
        audioProvider.play(widget.audio);
        widget.isPlaying = !widget.isPlaying;
      }
    });
  }

  int getTime(Duration duration) {
    return duration.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);

    var diff = audioProvider.duration - audioProvider.progress;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            width: MediaQuery.of(context).size.width - 15,
            child: LinearProgressIndicator(
              value: getTime(audioProvider.progress) /
                  (getTime(audioProvider.duration) <= 1
                      ? 1
                      : getTime(audioProvider.duration)),
              minHeight: 5,
            )),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                "${(diff.inSeconds / 60).ceil()}:${diff.inSeconds % 60}",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).canvasColor,
          child: IconButton(
            icon: Icon(
              widget.isPlaying ? Icons.pause : Icons.play_arrow_rounded,
              color: Colors.black,
            ),
            onPressed: () => handlePlay(audioProvider),
          ),
        )
      ],
    );
  }
}

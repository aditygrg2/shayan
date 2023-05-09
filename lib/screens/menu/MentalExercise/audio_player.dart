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
  bool load = true;

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
    if (load) {
      audioProvider.load(widget.audio);
      load = false;
    }

    var diff = audioProvider.duration - audioProvider.progress;

    return audioProvider.duration.inMilliseconds > 0
        ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 15,
                child: Slider(
                  value: audioProvider.progress.inMilliseconds.toDouble(),
                  onChanged: (value) {
                    audioProvider.seek(Duration(milliseconds: value.toInt()));
                  },
                  max: audioProvider.duration.inMilliseconds.toDouble(),
                  min: 0,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "${(audioProvider.progress.inMinutes).ceil().toString().padLeft(2, "0")}:${(audioProvider.progress.inSeconds % 60).toString().padLeft(2, "0")}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${(diff.inMinutes).ceil().toString().padLeft(2, "0")}:${(diff.inSeconds % 60).ceil().toString().padLeft(2, "0")}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        : const Center(
            child: Text(
              "Music is loading....",
            ),
          );
  }
}

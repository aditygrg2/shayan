import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

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
        audioProvider.play();
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
    return audioProvider.duration.inMilliseconds > 0
        ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width - 15,
                child: ProgressBar(
                  progress: audioProvider.progress,
                  total: audioProvider.duration,
                  buffered: audioProvider.buffered,
                  onSeek: (value) {
                    audioProvider.seek(value);
                  },
                  timeLabelTextStyle:
                      TextStyle(fontSize: 15, color: Colors.black),
                  timeLabelPadding: 15,
                  timeLabelType: TimeLabelType.remainingTime,
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
        : Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("Loading...", style: TextStyle(fontSize: 15),),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
              ],
            ));
  }
}

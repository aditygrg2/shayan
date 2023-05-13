import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayListPlayer extends StatefulWidget {
  bool isPlaying = false;
  List<Map<String, String>> playlist;
  Duration progress = const Duration();
  PlayListPlayer(this.playlist);
  int index = 0;
  @override
  State<PlayListPlayer> createState() => _PlayListPlayerState();
}

class _PlayListPlayerState extends State<PlayListPlayer> {
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
      audioProvider.load(widget.playlist[widget.index]['audio'] as String);
      if (widget.isPlaying) audioProvider.play();
      load = false;
    }
    return audioProvider.duration.inMilliseconds > 0
        ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 300,
                // it will be changed to network image later when images are uploaded
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.playlist[widget.index]['image'] as String,
                      fit: BoxFit.cover,
                    )),
              ),
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
                      const TextStyle(fontSize: 15, color: Colors.black),
                  timeLabelPadding: 15,
                  timeLabelType: TimeLabelType.remainingTime,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).canvasColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.skip_previous_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.index = widget.index - 1;
                            if (widget.index == -1)
                              widget.index = widget.playlist.length - 1;
                            if (widget.isPlaying) audioProvider.stop();
                            load = true;
                          });
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).canvasColor,
                      child: IconButton(
                        icon: Icon(
                          widget.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () => handlePlay(audioProvider),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).canvasColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.index = widget.index + 1;
                            if (widget.index == widget.playlist.length)
                              widget.index = 0;
                            if (widget.isPlaying) audioProvider.stop();
                            load = true;
                          });
                        },
                      ),
                    )
                  ],
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
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(),
              ],
            ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayListPlayer extends StatefulWidget {
  bool isPlaying = false;
  List<dynamic> playlist;
  Duration progress = const Duration();
  int index = 0;
  PlayListPlayer({required this.playlist, this.index = 0});
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
      audioProvider.load(widget.playlist[widget.index]['audio']).then((value) {
        if (value == false) {
          ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              content: const Text(
                "Sorry, something unexpected have occurred.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearMaterialBanners();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          );
          Timer(
              const Duration(
                seconds: 1,
              ), () {
            ScaffoldMessenger.of(context).clearMaterialBanners();
            Navigator.of(context).pop();
          });

          return;
        }
        if (widget.isPlaying) audioProvider.play();
        load = false;
      });
    }
    return audioProvider.duration.inMilliseconds > 0
        ? WillPopScope(
            onWillPop: () {
              if (widget.isPlaying) {
                return audioProvider.stop().then((value) => true);
              } else
                return Future(() => true);
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 200,
                  // it will be changed to network image later when images are uploaded
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.playlist[widget.index]['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.playlist[widget.index]['title']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Roboto'),
                  ),
                ),
                if (widget.playlist[widget.index].containsKey("description") &&
                    widget.playlist[widget.index] != "")
                  Text(widget.playlist[widget.index]['description']!),
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
                    timeLabelTextStyle: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    timeLabelPadding: 15,
                    timeLabelType: TimeLabelType.remainingTime,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).canvasColor,
                        ),
                      ),
                      child: Icon(
                        Icons.skip_previous_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 32,
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
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).canvasColor,
                        ),
                      ),
                      child: Icon(
                        widget.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 32,
                      ),
                      onPressed: () => handlePlay(audioProvider),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).canvasColor,
                        ),
                      ),
                      child: Icon(
                        Icons.skip_next_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 32,
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
  }
}

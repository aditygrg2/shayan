import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';

import 'package:provider/provider.dart';

class SmartPlayers extends StatefulWidget {
  String fileName;
  Function deleteRecordings;

  SmartPlayers(this.fileName, this.deleteRecordings);

  @override
  State<SmartPlayers> createState() => _SmartPlayersState();
}

class _SmartPlayersState extends State<SmartPlayers> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse(
        widget.fileName.split('files/')[1].trim().replaceAll('.m4a\'', ''));
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${DateFormat.yMMMMd('en_US').format(parsedDate)}",
                  ),
                  Text(
                    "Time : ${DateFormat.jm('en_US').format(parsedDate)}",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      var audioProvider =
                          Provider.of<AudioProvider>(context, listen: false);

                      if (playing) {
                        audioProvider.pause();
                        setState(() {
                          playing = false;
                        });
                      } else {
                        var string = widget.fileName
                            .replaceAll('\'', '')
                            .replaceAll('File:', '')
                            .trim()
                            .substring(1);
                        string = string.substring(0, string.length - 1);
                        audioProvider.playAsset(string);
                        setState(() {
                          playing = true;
                        });
                      }
                    },
                    icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.deleteRecordings(
                          widget.fileName
                              .replaceAll('File:', '')
                              .trim()
                              .substring(1),
                        );
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

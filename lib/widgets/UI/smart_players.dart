import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/smart_alarm_provider.dart';
import 'package:night_gschallenge/screens/menu/SmartAlarm/smartalarm.dart';
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
                  ),
                  Text(
                    "Duration : TBA",
                  ),
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
                    onPressed: () {
                      var audioProvider =
                          Provider.of<AudioProvider>(context, listen: false);
                      if (playing) {
                        audioProvider.pause();
                        setState(() {
                          playing = false;
                        });
                      } else {
                        audioProvider.playAsset(widget.fileName
                            .replaceAll('\'', '')
                            .replaceAll('File:', '')
                            .trim()
                            .substring(1));
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
                        widget.deleteRecordings(widget.fileName
                            .replaceAll('File:', '')
                            .trim()
                            .substring(1));
                      });
                    },
                    icon: Icon(Icons.delete),
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

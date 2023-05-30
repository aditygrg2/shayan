import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/count_down_timer.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/time_picker.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/widgets/UI/ListTileIconCreators.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MeditationTimer extends StatefulWidget {
  static String routeName = '/meditation';
  bool isShowPicker;
  DateTime datetime = DateTime.parse('1900-12-24 00:00:00.000');
  int selectedIndex;
  MeditationTimer({this.isShowPicker = true, this.selectedIndex = 0});
  List<Map<dynamic, dynamic>> options = [
    {
      'icon': Icons.notifications,
      'title': 'Default',
      'music': 'https://dl.sndup.net/bwnj/default.mp3'
    },
    {
      'icon': Icons.forest,
      'title': 'Forest',
      'music': 'https://dl.sndup.net/wgf4/summer_night.mp3',
    },
    {
      'icon': Icons.nightlight,
      'title': 'Summer Night',
      'music': 'https://dl.sndup.net/wgf4/summer_night.mp3'
    },
    {
      'icon': Icons.beach_access_rounded,
      'title': 'Beach',
      'music': 'https://dl.sndup.net/s5vk/beach.mp3'
    },
    {
      'icon': Icons.nightlife,
      'title': 'Summer Rain',
      'music': 'https://dl.sndup.net/snt9/summer_rain.mp3'
    },
    {
      'icon': Icons.fireplace,
      'title': 'Stove Fire',
      'music': 'https://dl.sndup.net/q9rv/stove_fire.mp3'
    },
  ];

  @override
  State<MeditationTimer> createState() => _MeditationTimerState();
}

class _MeditationTimerState extends State<MeditationTimer> {
  void handleClick(AudioProvider audio, BuildContext context) {
    audio.load(widget.options[widget.selectedIndex]['music']).then((value) {
      Navigator.of(context).pop();
      setState(() {
        widget.isShowPicker = !widget.isShowPicker;
      });
      audio.play();
    });
  }

  void callBackDateTime(DateTime datetime) {
    setState(() {
      widget.datetime = datetime;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CountDownProvider>(context);
    var audio = Provider.of<AudioProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: 'Meditation Timer',
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 200,
                  child: ImageCacher(
                    imagePath:
                        "https://i.ibb.co/z8k8p2F/meditation-timer-person.gif",
                    fit: BoxFit.contain,
                  ),
                ),
                !widget.isShowPicker
                    ? CountDownTimerComponent(widget.datetime, audio,controller)
                    : TimePicker(callBackDateTime),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: !widget.isShowPicker ? 100 : 250,
            child: !widget.isShowPicker
                ? Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Icon(
                            widget.options[widget.selectedIndex]['icon'],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.options[widget.selectedIndex]['title'],
                          ),
                        )
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 2),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          padding: const EdgeInsets.all(4),
                          decoration: widget.selectedIndex == index
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                    width: 2,
                                  ),
                                )
                              : null,
                          child: Column(children: [
                            Expanded(
                              child: Icon(
                                widget.options[index]['icon'],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.options[index]['title'],
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                    itemCount: widget.options.length,
                  ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!widget.isShowPicker)
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).canvasColor,
                    child: IconButton(
                      onPressed: () {
                        audio.release();
                        controller.removeListener(() {
                          
                        },);
                        setState(() {
                          widget.isShowPicker = !widget.isShowPicker;
                        });
                      },
                      icon: Icon(
                        Icons.stop_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).canvasColor,
                  child: IconButton(
                    onPressed: () {
                      if (!widget.isShowPicker) {
                        if (controller.isPause) {
                          controller.resume();
                          audio.resume();
                        } else {
                          controller.pause();
                          audio.pause();
                        }
                        setState(() {});
                      } else {
                        if (widget.datetime.compareTo(
                                DateTime.parse('1900-12-24 00:00:00.000')) ==
                            0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                            child: const Text("Please select Time Duration"),
                          )));
                          return;
                        }
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            );
                          },
                        );
                        controller.initialize();
                        handleClick(audio, context);
                      }
                    },  
                    icon: Icon(
                      !widget.isShowPicker
                          ? (controller.isPause
                              ? Icons.play_arrow
                              : Icons.pause)
                          : Icons.play_arrow,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTileIconCreators(
            icon: Icons.shape_line_outlined,
            title: 'Check out meditation exercises',
            onTap: () =>
                Navigator.of(context).pushNamed(MentalExercise.routeName),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

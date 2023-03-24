import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/count_down_timer.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/time_picker.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:provider/provider.dart';

class MeditationTimer extends StatefulWidget {
  static String routeName = '/meditation';
  bool isShowPicker;
  late DateTime datetime;
  int selectedIndex;
  MeditationTimer({this.isShowPicker = true, this.selectedIndex = 0});
  List<Map<dynamic, dynamic>> options = [
    {
      'icon': Icons.notifications,
      'title': 'Default',
      'music': 'assets/default.mp3'
    },
    {
      'icon': Icons.forest_outlined,
      'title': 'Forest',
      'music': 'assets/forest.mp3'
    },
    {
      'icon': Icons.nightlight,
      'title': 'Summer Night',
      'music': 'assets/summer_night.mp3'
    },
    {
      'icon': Icons.beach_access_rounded,
      'title': 'Beach',
      'music': 'assets/beach.mp3'
    },
    {
      'icon': Icons.nightlife,
      'title': 'Summer Rain',
      'music': 'assets/summer_rain.mp3'
    },
    {
      'icon': Icons.fireplace,
      'title': 'Stove Fire',
      'music': 'assets/stove_fire.mp3'
    },
  ];

  @override
  State<MeditationTimer> createState() => _MeditationTimerState();
}

class _MeditationTimerState extends State<MeditationTimer> {
  void handleClick() {
    setState(() {
      widget.isShowPicker = !widget.isShowPicker;
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
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/6be6/74f2/3d268a7deeda15506065256569c5fa43?Expires=1680480000&Signature=Ef9e0KX5K6M2MRcoHDV~fEMKTdtCdrf2CzqE5mUcIctPr0~85thiZ7cI1VqeNFCuyKKMerURsS5O5LlCTy5s1arsZDJH9MILz356BgACjK3PZIlLldT7vYZyDFmJgwMdU1rgoWILP6EPVjU6QVfevXvrnI45jCQwX378jrKViAxG0CZHkwqasuf1EXemTnTvRfdZbp0zFrMgLTiw58Mt6Ti60YMwlMTl~-Na2TqlsXOA-39q5wUznQewMmoaXdiNG4~33-7pJe7Z~UIdB6e7m7bTtn7HlfdjoB0yhZRSGa7wxVnaBA77YaubXi18WtxnvNI3SDQB7lgySfYyukk32g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    fit: BoxFit.contain,
                  ),
                ),
                !widget.isShowPicker
                    ? CountDownTimerComponent(widget.datetime)
                    : TimePicker(callBackDateTime),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: !widget.isShowPicker
                ? Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Expanded(
                          child: Icon(
                              widget.options[widget.selectedIndex]['icon'])),
                      Expanded(
                          child: Text(
                              widget.options[widget.selectedIndex]['title']))
                    ]),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: widget.selectedIndex == index
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey))
                            : null,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selectedIndex = index;
                            });
                          },
                          child: Column(children: [
                            Expanded(
                                child: Icon(widget.options[index]['icon'])),
                            Expanded(
                                child: Text(widget.options[index]['title']))
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
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!widget.isShowPicker)
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromRGBO(143, 227, 221, 1),
                    child: IconButton(
                      onPressed: () {
                        audio.stop();
                        setState(() {
                          widget.isShowPicker = !widget.isShowPicker;
                        });
                      },
                      icon: Icon(
                        Icons.stop_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(143, 227, 221, 1),
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
                        } else {
                          handleClick();
                          audio.play(
                              widget.options[widget.selectedIndex]['music']);
                        }
                      },
                      icon: Icon(
                        !widget.isShowPicker
                            ? (controller.isPause
                                ? Icons.play_arrow
                                : Icons.pause)
                            : Icons.play_arrow,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Consult our meditation tips for better results!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Center(
            child: ElevatedButtonWithoutIcon(
              text: "Explore",
              onPressedButton: null,
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

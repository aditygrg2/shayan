import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/count_down_timer.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/time_picker.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MeditationTimer extends StatefulWidget {
  static String routeName = '/meditation';
  bool isPlaying;
  late DateTime datetime;
  MeditationTimer({this.isPlaying = false});
  List<Map<dynamic, dynamic>> options = [
    {
      'icon': Icons.notifications,
      'title': 'Default',
    },
    {
      'icon': Icons.forest_outlined,
      'title': 'Forest',
    },
    {
      'icon': Icons.nightlight,
      'title': 'Summer Night',
    },
    {
      'icon': Icons.beach_access_rounded,
      'title': 'Beach',
    },
    {
      'icon': Icons.nightlife,
      'title': 'Summer Rain',
    },
    {
      'icon': Icons.fireplace,
      'title': 'Stove Fire',
    },
  ];

  @override
  State<MeditationTimer> createState() => _MeditationTimerState();
}

class _MeditationTimerState extends State<MeditationTimer> {
  void handleClick() {
    setState(() {
      widget.isPlaying = !widget.isPlaying;
    });
  }

  void callBackDateTime(DateTime datetime) {
    setState(() {
      widget.datetime = datetime;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    )),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          Expanded(child: Icon(widget.options[index]['icon'])),
                          Expanded(child: Text(widget.options[index]['title']))
                        ]),
                      );
                    },
                    itemCount: widget.options.length,
                  ),
                ),
              ],
            ),
          ),
          widget.isPlaying
              ? CountDownTimerComponent(widget.datetime)
              : TimePicker(callBackDateTime),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            // decoration: BoxDecoration(color: Colors.red),
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(143, 227, 221, 1),
                  child: IconButton(
                    onPressed: handleClick,
                    icon: Icon(
                      widget.isPlaying
                          ? Icons.stop_rounded
                          : Icons.music_note_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(143, 227, 221, 1),
                  child: IconButton(
                      onPressed: handleClick,
                      icon: Icon(
                        widget.isPlaying ? Icons.pause : Icons.play_arrow,
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
        ],
      ),
    );
  }
}

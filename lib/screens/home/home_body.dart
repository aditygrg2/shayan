import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:night_gschallenge/providers/sleep_report_data_provider.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/widgets/home_screen/music_section.dart';
import 'package:night_gschallenge/widgets/home_screen/sleep_score.dart';
import 'package:night_gschallenge/widgets/home_screen/watch_component.dart';
import 'package:night_gschallenge/widgets/home_screen/welcome_user.dart';
import 'package:night_gschallenge/widgets/home_screen/sleep_stats.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool loading = true;
  bool? isSS;
  int sleepScore = 1;
  final calmData = {'title': 'Calm Tunes', 'tunes': [], 'buttonLink': '/Home'};

  final recents = {
    'title': 'Recents Added',
    'tunes': [],
    'buttonLink': '/Home'
  };

  final newsData = {
    'title': 'News Update',
    'news': ['a', 'b', 'c'],
    'buttonLink': '/Home'
  };

  void checkData() async {
    await Provider.of<SleepElements>(context, listen: false)
        .getSleepElements()
        .then((value) {
      isSS = Provider.of<SleepElements>(context, listen: false)
          .isSleepScorePresent;
    });

    if (isSS!) {
      sleepScore =
          Provider.of<SleepElements>(context, listen: false).sleepScore;
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkData();
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: double.infinity,
            child: Column(
              children: [
                WelcomeUser(),
                isSS!
                    ? SleepScore(
                        sleepscore: sleepScore,
                      )
                    : Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Text(
                              'Generate your sleep score',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(SleepForm.routeName),
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                WhatsNew(),
                WatchComponent(),
                MusicSection(),
              ],
            ),
          );
  }
}

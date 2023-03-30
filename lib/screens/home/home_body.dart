import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
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
  bool once = true;
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

  Future data() async {
    await Provider.of<SleepElements>(context, listen: false).getSleepElements();

    isSS =
        Provider.of<SleepElements>(context, listen: false).isSleepScorePresent;

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
    var id = FirebaseAuth.instance.currentUser?.uid;
    if (once) {
      data();
      once = false;
    }
    return loading
        ? const Center(
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
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text(
                                (id != null)
                                    ? 'Generate your sleep score'
                                    : 'Sleep better, create an account now!',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  if (id == null) {
                                    Navigator.of(context).popAndPushNamed(
                                        SignupScreen.routeName);
                                  } else {
                                    Navigator.of(context)
                                        .pushNamed(SleepForm.routeName);
                                  }
                                },
                                icon: const Icon(
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

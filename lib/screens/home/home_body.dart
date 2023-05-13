import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
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
  bool isWatchConnected = false;
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
    var id = FirebaseAuth.instance.currentUser?.uid;
    if(id != null){
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) {
        if (value.exists){
          isWatchConnected = value['isWatchConnected'];
        }
      });
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
        ?  Center(
            child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
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
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                (id != null)
                                    ? 'Generate your sleep score'
                                    : 'Sleep better, create an account now!',
                                textAlign: TextAlign.start,
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
                id == null
                    ? Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            HomeScreenText(
                              text: 'Start your journey',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).splashColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset('assets/cloud.png'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Trouble falling asleep?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      'Start your journey to better sleep. Let\'s create your sleep plan',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  
                                  ElevatedButtonWithoutIcon(
                                    onPressedButton: () {
                                      Navigator.of(context)
                                          .pushNamed(MainForm.routeName);
                                    },
                                    text: 'Get your plan',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : WhatsNew(),

                if(!isWatchConnected)
                WatchComponent(),
                MusicSection(),
              ],
            ),
          );
  }
}

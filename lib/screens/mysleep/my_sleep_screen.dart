import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/mysleep/weeky_sleep_analysis.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import 'package:night_gschallenge/widgets/UI/ListTileIconCreators.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_report_analysis.dart';
import 'package:provider/provider.dart';
import '../../widgets/sleep_screen/sleep_score_card.dart';

class MySleepScreen extends StatefulWidget {
  static const routeName = '/mySleep';

  @override
  State<MySleepScreen> createState() => _MySleepScreenState();
}

class _MySleepScreenState extends State<MySleepScreen> {
  int? sleepscore;
  bool loading = true;
  bool isSS = false;
  bool once = true;
  String? totalSleepTime;
  String? SleepEfficiency;
  String? timeInBed;
  String? awakenings;

  void checkData() {
    isSS = Provider.of<SleepElements>(context).isSleepScorePresent;
    if (isSS) {
      sleepscore =
          Provider.of<SleepElements>(context, listen: false).sleepScore;

      var data = Provider.of<SleepElements>(context, listen: false);

      totalSleepTime = '${data.totalSleepTime}';
      SleepEfficiency = '${data.sleepEfficiency}%';
      timeInBed = '${data.timeInBed}';
      awakenings = '${data.awakenings}';
    }

    setState(() {
      loading = false;
    });
  }

  String informativeText(int sleepscore) {
    if (sleepscore > 85) {
      return 'You are doing good. Keep it up!';
    } else if (sleepscore > 50) {
      return 'To maintain optimal performance, you may require more rest';
    }

    return 'We will help you get up to the mark!';
  }

  @override
  Widget build(BuildContext context) {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    if (once) {
      once = false;
      checkData();
    }

    String text = '';

    return Column(
      children: [
        HomeScreenText(text: 'Sleep Score'),
        if (loading) const CircularProgressIndicator(),
        if (!loading && isSS)
          SleepScoreCard(
            text: informativeText(sleepscore!),
            sleepscore: sleepscore,
          ),
        if (!loading && isSS)
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: <Widget>[
              PropertyCard(
                score:
                    '${((int.parse(totalSleepTime!)) / 60).round()} hr ${(int.parse(totalSleepTime!)) % 60} min',
                title: 'Total Sleep Time',
              ),
              PropertyCard(
                score: SleepEfficiency!,
                title: 'Sleep Efficiency',
              ),
              PropertyCard(
                score: awakenings!,
                title: 'Wakefulness',
              ),
              PropertyCard(
                score: timeInBed!,
                title: 'Time in Bed',
              ),
            ],
          ),
        if (!loading && isSS)
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Theme.of(context).canvasColor,
            ),
            child: Row(
              children: [
                const Text(
                  'Add sleep data to the tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(SleepForm.routeName),
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
        if (!loading && isSS) WeeklySleepAnalysis(),
        if (!loading && !isSS)
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Theme.of(context).canvasColor,
            ),
            child: Column(
              children: [
                MenuHeroImage(
                  image: 'assets/data.gif',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Share your sleep experince, daily haits and overall lifestyle patterns and manage your sleep',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButtonWithoutIcon(
                    text:
                        id != null ? 'Get your sleep data' : 'Login to proceed',
                    onPressedButton: () {
                      if (id != null)
                        Navigator.of(context).pushNamed(SleepForm.routeName);
                      else
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          SplashScreen.routeName,
                          (Route<dynamic> route) => false,
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 50,
        ),
        if (!loading && isSS)
          ListTileIconCreators(
            title: 'Check out your latest sleep report',
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return SleepReportAnalysis();
                },
              );
            },
            icon: Icons.change_circle,
          ),
        if (!loading && isSS)
          ListTileIconCreators(
            title: 'Calculate sleep cycles',
            onTap: () {
              Navigator.of(context).pushNamed(SleepCycleCalculator.routeName);
            },
            icon: Icons.calculate,
          ),
        if (!loading && isSS)
          ListTileIconCreators(
            title: 'Listen to music according to your mood',
            onTap: () {
              Navigator.of(context).pushNamed(MusicTherapy.routeName);
            },
            icon: Icons.music_note,
          ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

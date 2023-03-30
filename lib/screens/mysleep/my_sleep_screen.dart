import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/mysleep/weeky_sleep_analysis.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/menuHeroImage.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:night_gschallenge/widgets/home_screen/watch_component.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_report.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_repot_analysis.dart';
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
    }

    var data = Provider.of<SleepElements>(context, listen: false);

    totalSleepTime = '${data.totalSleepTime}';
    SleepEfficiency = '${data.sleepEfficiency}%';
    timeInBed = '${data.timeInBed}';
    awakenings = '${data.awakenings}';

    print(isSS);

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
    if (once) {
      checkData();
      once = false;
    }
    ;
    String text = '';

    return Column(
      children: [
        HomeScreenText(text: 'Sleep Score'),
        if (loading) CircularProgressIndicator(),
        if (!loading)
          SleepScoreCard(
            text: informativeText(sleepscore!),
            sleepscore: sleepscore,
          ),

        if (!loading && isSS)
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
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
        if (!loading && isSS) WeeklySleepAnalysis(),

        if (!loading && !isSS)
          Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Theme.of(context).canvasColor,
              ),
              child: Column(children: [
                MenuHeroImage(
                  image: 'assets/data.gif',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Share your sleep experince, daily haits and overall lifestyle patterns and manage your sleep',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
              ])),
        if (!loading && isSS)
          Center(
            child: ElevatedButtonWithoutIcon(
              text: 'Get your sleep data',
              onPressedButton: () {
                Navigator.of(context).pushNamed(SleepForm.routeName);
              },
            ),
          ),
        SizedBox(
          height: 50,
        ),
        if (!loading && isSS)
          ElevatedButtonWithoutIcon(
            text: "get Your Sleep Report",
            onPressedButton: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return SleepReportAnalysis();
                },
              );
            },
          ),
        if (!loading && isSS)
          Center(
            child: ElevatedButtonWithoutIcon(
              text: 'Get your sleep data',
              onPressedButton: () {
                Navigator.of(context).pushNamed(SleepForm.routeName);
              },
            ),
          ),
        SizedBox(
          height: 50,
        )

        // MySleepReport()
      ],
    );
  }
}

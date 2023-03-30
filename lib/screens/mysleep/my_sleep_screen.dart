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
  void checkData() {
    isSS = Provider.of<SleepElements>(context).isSleepScorePresent;
    if (isSS) {
      sleepscore = Provider.of<SleepElements>(context).sleepScore;
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkData();
    return Column(
      children: [
        HomeScreenText(text: 'Sleep Score'),
        if (loading) CircularProgressIndicator(),

        if (!loading && isSS)
          Container(
            child: Wrap(
              spacing: 20,
              runSpacing: 12,
              children: [
                PropertyCard(),
                PropertyCard(),
                PropertyCard(),
                PropertyCard(),
              ],
            ),
          ),
        if (!loading && isSS) WeeklySleepAnalysis(),

        if (!loading && !isSS)
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Column(
                  children: [
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
                  ],
                ),
              ),
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
            ],
          ),
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
        )
        // MySleepReport()
      ],
    );
  }
}

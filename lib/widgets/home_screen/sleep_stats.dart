import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:provider/provider.dart';

class WhatsNew extends StatefulWidget {
  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    bool ss =
        Provider.of<SleepElements>(context, listen: false).isSleepScorePresent;
    int? tst;
    int? SE;
    if (ss) {
      tst = Provider.of<SleepElements>(context, listen: false).totalSleepTime;
      SE = Provider.of<SleepElements>(context, listen: false).sleepEfficiency;
    }
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Column(
        children: [
          HomeScreenText(text: 'Sleep Elements'),
          Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: PropertyCard(
                  color: Theme.of(context).splashColor,
                  score: ss == false
                      ? 'Data not available'
                      : '${((int.parse(tst.toString())) / 60).round()} hr ${(int.parse(tst.toString())) % 60} min',
                  title: 'Total Sleep Time',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: PropertyCard(
                  color: Theme.of(context).splashColor,
                  score:
                      ss == false ? 'Data not available' : '${SE.toString()}%',
                  title: 'Sleep Efficiency',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (ss == true)
                Text(
                  'Check out more details on My Sleep Page',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              if (ss == false)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SleepForm.routeName);
                  },
                  child: Text(
                    'Fill out the form for fetching data',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/time_duration_picker.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/zen_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class PhoneFreeTime extends StatelessWidget {
  static String routeName = '/phone-free-time';
  List<String> info = [
    "Mode can not be exited once started",
    "Incoming notifications will be temporarily muted",
    "You can still answer phone calls and make emergency phone calls",
    "All apps will be temporarily locked except the camera",
  ];
  int duration = 0;
  void callbackSetDuration(String time){
    this.duration = int.parse(time);
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
            text: "Phone Free Time",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(143, 227, 221, 1)),
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Text(
                  'Before You Start',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                ...info.map((element) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/check-mark.png',
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                            child: Text(
                          element,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                      ],
                    ),
                  );
                }).toList(),
              ]),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.48,
                height: 140,
                child: Image.asset(
                  "assets/phone_free_time.gif",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.52,
                height: 140,
                child: TimeDurationPicker(callbackSetDuration),
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButtonWithoutIcon(
              onPressedButton: (){
                Navigator.of(context).pushNamed(ZenScreen.routeName,arguments: duration);
              },
              text: 'Start',
            ),
          ),
        ],
      ),
    );
  }
}

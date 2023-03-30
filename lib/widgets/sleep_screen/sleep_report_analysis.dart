import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_report_data_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_report_card.dart';
import 'package:provider/provider.dart';

class SleepReportAnalysis extends StatelessWidget {
  List<Map<String, dynamic>> reports = [
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy',
      'icon': Icons.heart_broken
    },
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy',
      'icon': Icons.heart_broken
    },
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy',
      'icon': Icons.heart_broken
    },
  ];
  @override
  Widget build(BuildContext context) {
    var sleepReportProvider = Provider.of<SleepReportDataProvider>(context);
    var data = sleepReportProvider.getDiseaseStats();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.get('healthState') == 'NA') {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Image.asset("assets/music_therapy_joyful.png"),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Sleep Report",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please fill out the assessment to let us understand your sleep for your report.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButtonWithoutIcon(
                  text: 'Take me to the questionnaire',
                  onPressedButton: () {
                    Navigator.of(context).popAndPushNamed(MainForm.routeName);
                  },
                ),
              ],
            ),
          );
        } else {
          return FutureBuilder(
            future:
                Provider.of<SleepReportDataProvider>(context).getDiseaseStats(),
            builder: (context, snapshot) {
              String? text;
              if (snapshot.connectionState == ConnectionState.done) {
                bool isHealty = true;
                if (snapshot.data?.get('apnea') >= (20)) {
                  text = "Apnea";
                  isHealty = false;
                } else if (snapshot.data?.get('insomia') >= (20)) {
                  text = "Insomnia";
                  isHealty = false;
                } else if (snapshot.data?.get('sleep_deprivation') >= (20)) {
                  text = "Sleep Deprivation";
                  isHealty = false;
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Scaffold(
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Sleep Status',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50 -
                                          40,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    text!,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/checklist.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: reports.map((element) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width - 80,
                              padding: EdgeInsets.all(10),
                              child: SleepReportCard(
                                heading: element['title'],
                                value: element['score'],
                                information: element['description'],
                                icon: element['icon'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 40,
                        ),
                      ])
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get(),
    );
  }
}

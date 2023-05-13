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
      'title': 'Mindfulness',
      'score': ' ',
      'description':
          'Perform practical techniques to cultivate mindfulness and reduce stress.',
      'icon': Icons.health_and_safety
    },
    {
      'title': 'Productivity',
      'score': ' ',
      'description':
          'Maximizing your time and energy to achieve more and reach your goals.',
      'icon': Icons.grid_view_rounded
    },
    {
      'title': 'Sleep',
      'score': ' ',
      'description':
          'Chat with a sleep expert and discover tips and techniques for getting a better night\'s rest.',
      'icon': Icons.bed
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
            child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
          );
        }
        if (snapshot.data?.get('healthState') == 'NA') {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Image.asset("assets/music_therapy_joyful.png"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Sleep Report",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please fill out the assessment to let us understand your sleep for your report.",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
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
                text = 'Healthy';
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
                  child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
                );
              }
              return Scaffold(
                body: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Sleep Status',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.50 -
                                        40,
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  text!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
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
                          children: reports.map(
                            (element) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: const EdgeInsets.all(10),
                                child: SleepReportCard(
                                  heading: element['title'],
                                  value: element['score'],
                                  information: element['description'],
                                  icon: element['icon'],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).iconTheme.color,
                            size: 40,
                          ),
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

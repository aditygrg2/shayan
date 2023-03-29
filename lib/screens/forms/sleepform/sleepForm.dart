import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepScoreFormInput.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/watchstatus.dart';
import 'package:night_gschallenge/widgets/form/InputBox.dart';

class SleepForm extends StatefulWidget {
  static const routeName = 'sleepform';

  @override
  _SleepFormState createState() => _SleepFormState();
}

class _SleepFormState extends State<SleepForm> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String? value1;
  String? value2;
  String? value3;
  String? value4;
  String? value5;
  String? value6;
  String timeValue = DateTime.now().toString();
  late String valueSelected = timeValue;

  void _valueHandler(value, key) {
    if (key == "1") {
      value1 = value;
    } else if (key == '2') {
      value2 = value;
    } else if (key == '3') {
      value3 = value;
    } else if (key == '4') {
      value4 = value;
    } else if (key == '5') {
      value5 = value;
    } else if (key == '6') {
      value6 = value;
    }
  }

  void _submitHandler() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    setState(() {
      loading = true;
    });

    DateTime wakeUpTime = DateFormat.jm().parse(value5!);
    DateTime RealWakeUpTime = DateFormat.jm().parse(value6!);
    DateTime RealSleepingTime = DateFormat.jm()
        .parse(value1!)
        .add(Duration(minutes: int.parse(value2!)));

    int TST =
        RealSleepingTime.difference(wakeUpTime).inMinutes - int.parse(value4!);
    int WFN = int.parse(value3!);
    int SL = int.parse(value2!);
    int WASO = 7 -
        TST; // can be negative, more sleep than required. Do not deduct points.
    int WASF = RealWakeUpTime.difference(wakeUpTime).inMinutes;

    await FirebaseFirestore.instance
        .collection('sleepData')
        .doc(id)
        .collection('dates')
        .doc(valueSelected.split(' ')[0])
        .set({'TST': TST, 'WFN': WFN, 'SL': SL, 'WASO': WASO, 'WASF': WASF});

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _inputQuestions = [
      {
        'key': '1',
        'question': 'I turned off the lights intending to fall asleep at',
        'type': InputTypes.TimeInput,
        'value': value1
      },
      {
        'key': '2',
        'question': 'Time it took me to fall asleep(in minutes)',
        'type': InputTypes.NumberInput,
      },
      {
        'key': '3',
        'question': 'Number of times I woke up',
        'type': InputTypes.NumberInput,
      },
      {
        'key': '4',
        'question': 'Total time I was awake during the night(in minutes)',
        'type': InputTypes.NumberInput,
      },
      {
        'key': '5',
        'question': 'Last time I woke up',
        'type': InputTypes.TimeInput,
      },
      {
        'key': '6',
        'question': 'The time I lastly got out of bed',
        'type': InputTypes.TimeInput,
      },
    ];
    bool today = (valueSelected == timeValue);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.of(context)
                              .popAndPushNamed(HomeScreen.routeName);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            DateFormat('EEEEE, MMMM d', 'en_US').format(
                              DateTime.parse(valueSelected),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1900, 1, 1),
                            lastDate: DateTime.now().subtract(
                              Duration(days: 18 * 365),
                            ),
                          ).then(
                            (value) {
                              setState(
                                () {
                                  valueSelected = value.toString();
                                },
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        today == true
                            ? 'Tell us about your last night sleep'
                            : 'Add your sleep data',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Forgot to update other days? Tap on calendar icon at the top right of your screen and choose date for which you want to fill your sleep information for. It is crucial for us to help you sleep.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WatchStatus(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ..._inputQuestions.map(
                              (e) => SleepScoreFormInput(
                                keya: e['key'],
                                question: e['question'],
                                type: e['type'],
                                value: _valueHandler,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      loading
                          ? Center(child: CircularProgressIndicator())
                          : Center(
                              child: ElevatedButtonWithoutIcon(
                                text: 'Submit',
                                onPressedButton: () async {
                                  _submitHandler();
                                },
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

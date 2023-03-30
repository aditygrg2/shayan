import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepScoreFormInput.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/watchstatus.dart';
import 'package:night_gschallenge/widgets/form/InputBox.dart';
import 'package:provider/provider.dart';

class SleepForm extends StatefulWidget {
  static const routeName = 'sleepform';

  @override
  _SleepFormState createState() => _SleepFormState();
}

class _SleepFormState extends State<SleepForm> {
  final _formKey = GlobalKey<FormState>();
  String? value1;
  String? value2;
  String? value3;
  String? value4;
  String? value5;
  String? value6;
  bool loading = false;
  bool status = false;
  final List<Map<dynamic, dynamic>> _inputQuestions = [
    {
      'key': '1',
      'question': 'I turned off the lights intending to fall asleep at',
      'type': InputTypes.TimeInput,
      'initialValue': null,
    },
    {
      'key': '2',
      'question': 'Time it took me to fall asleep(in minutes)',
      'type': InputTypes.NumberInput,
      'initialValue': null,
      'initialText': -1
    },
    {
      'key': '3',
      'question': 'Number of times I woke up',
      'type': InputTypes.NumberInput,
      'initialValue': null,
      'initialText': -1
    },
    {
      'key': '4',
      'question': 'Total time I was awake during the night(in minutes)',
      'type': InputTypes.NumberInput,
      'initialValue': null,
      'initialText': -1
    },
    {
      'key': '5',
      'question': 'Last time I woke up',
      'type': InputTypes.TimeInput,
      'initialValue': null,
      'initialText': -1
    },
    {
      'key': '6',
      'question': 'The time I lastly got out of bed',
      'type': InputTypes.TimeInput,
      'initialValue': null,
      'initialText': -1
    },
  ];

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

  bool valueSelectorForWatch() {
    var watchData = Provider.of<WatchDataProvider>(context, listen: false);

    if (watchData.sleptOn != null) {
      setState(() {
        _inputQuestions[0]['initialValue'] = TimeOfDay.fromDateTime(
            DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                .parse(watchData.sleptOn.toString()));
        _inputQuestions[1]['initialText'] = 15;
        _inputQuestions[2]['initialText'] = 0;
        _inputQuestions[3]['initialText'] = 0;
        _inputQuestions[4]['initialValue'] = TimeOfDay.fromDateTime(
            DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                .parse(watchData.sleptTill.toString()));
        _inputQuestions[5]['initialValue'] = TimeOfDay.fromDateTime(
            DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                .parse(watchData.sleptTill.toString()));


        status = true;
      });

      return true;
    } 

    else{
      return false;
    }
  }

  void _submitHandler() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;

    setState(() {
      loading = true;
    });

    QuerySnapshot dataForLength = await FirebaseFirestore.instance
        .collection('sleepData')
        .doc(id)
        .collection('dates')
        .get();
    List<DocumentSnapshot> _myDocCount = dataForLength.docs;
    int length = _myDocCount.length;

    var sleepElements = Provider.of<SleepElements>(context, listen: false);
    sleepElements.getData(
        value1, value2, value3, value4, value5, value6, length);

    await FirebaseFirestore.instance
        .collection('sleepData')
        .doc(id)
        .collection('dates')
        .doc(valueSelected.split(' ')[0])
        .set({
      'TST': sleepElements.TST,
      'WFN': sleepElements.WFN,
      'SL': sleepElements.SL,
      'WASO': sleepElements.WASO,
      'WASF': sleepElements.WASF,
      'SE': sleepElements.SE,
      'TIB': sleepElements.TIB
    });

    // This constitutes average data.
    if (length > 1) {
      final prevState = await FirebaseFirestore.instance
          .collection('sleepData')
          .doc(id)
          .get();
      await FirebaseFirestore.instance.collection('sleepData').doc(id).set({
        'TST': ((sleepElements.TST! + prevState['TST']) / (length + 1)),
        'WFN': (sleepElements.WFN! + prevState['WFN']) / (length + 1),
        'SL': (sleepElements.SL! + prevState['SL']) / (length + 1),
        'WASO': (sleepElements.WASO! + prevState['WASO']) / (length + 1),
        'WASF': (sleepElements.WASF! + prevState['WASF']) / (length + 1),
        'SE': (sleepElements.WASO! + prevState['WASO']) / (length + 1),
        'TIB': (sleepElements.TIB! + prevState['TIB']) / (length + 1),
      });
    } else if (length <= 1) {
      await FirebaseFirestore.instance.collection('sleepData').doc(id).set({
        'TST': sleepElements.TST,
        'WFN': sleepElements.WFN,
        'SL': sleepElements.SL,
        'WASO': sleepElements.WASO,
        'WASF': sleepElements.WASF,
        'SE': sleepElements.SE,
        'TIB': sleepElements.TIB
      });
    }

    // This is not supporting average currently, like if same date data is changed, the average needs to remove the previous data.
    // Can be done later.
    final value =
        await FirebaseFirestore.instance.collection('sleepData').doc(id).get();

    int sleepScore = 0;

    if (value['TST'] > 8) {
      sleepScore += 35;
    } else {
      sleepScore += (((value['TST'] as int) / 8) * 35).toInt();
    }

    if (value['SL'] < 10) {
      sleepScore += 20;
    } else {
      var increment = value['SL'] - 10;
      sleepScore += (20 - ((increment as int) / 20)).toInt();
    }

    int sleepCycles = ((value['TST'] as int) / 90).toInt();
    if (sleepCycles >= 5) {
      sleepScore += 20;
    } else {
      if (sleepCycles >= 0) {
        sleepScore += sleepCycles * 5;
      }
    }

    if (value['WASO'] < 0) {
      sleepScore += 10;
    } else {
      if (value['WASO'] < 100) {
        sleepScore += (10 - (value['WASO'] / 10)).toInt();
      }
    }

    if (value['WASO'] < 0) {
      sleepScore += 10;
    } else {
      if (value['WASO'] < 100) {
        sleepScore += (10 - (value['WASO'] / 10)).toInt();
      }
    }

    if (value['WFN'] < 2) {
      sleepScore += 5;
    }

    await FirebaseFirestore.instance
        .collection('sleepData')
        .doc(id)
        .update({'SS': sleepScore});

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'SSCreated': true,
    });

    Provider.of<SleepElements>(context, listen: false).updateCheck();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(
                              Duration(days: 30),
                            ),
                            lastDate: DateTime.now(),
                          ).then(
                            (value) {
                              if (value != null) {
                                setState(
                                  () {
                                    valueSelected = value.toString();
                                  },
                                );
                              }
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
                      WatchStatus(
                        time: DateTime.parse(valueSelected),
                        valueSelector: valueSelectorForWatch,
                        status: status
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ..._inputQuestions.map(
                              (e) {
                                if (e['type'] == InputTypes.TimeInput) {
                                  return SleepScoreFormInput(
                                      keya: e['key'],
                                      question: e['question'],
                                      type: e['type'],
                                      value: _valueHandler,
                                      initialValue: e['initialValue']);
                                }
                                return SleepScoreFormInput(
                                  keya: e['key'],
                                  question: e['question'],
                                  type: e['type'],
                                  value: _valueHandler,
                                  initialText: e['initialText'],
                                );
                              },
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

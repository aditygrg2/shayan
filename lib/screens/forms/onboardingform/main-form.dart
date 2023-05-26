import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/sleep_disease_provider.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/form/InputBox.dart';
import 'package:night_gschallenge/widgets/form/mcq_widget.dart';

class MainForm extends StatefulWidget {
  static const routeName = 'forms/main';
  _MainFormState createState() => _MainFormState();
}

// ignore: constant_identifier_names
enum InputTypes { TimeInput, NumberInput, HourMinuteInput, DateInput }

class _MainFormState extends State<MainForm> {
  bool once = true;
  bool loading = false;
  int _currentQuestion = 0;
  var id = FirebaseAuth.instance.currentUser?.uid;
  // Change if you are changing number of questions!
  int no_of_questions = 34;
  final _answers = List.filled(34, '-1');

  void getQuestion() async {
    once = false;
    setState(() {
      loading = true;
    });
    var data =
        await FirebaseFirestore.instance.collection('users').doc(id).get();

    setState(() {
      if (data['questionNumber'] + 1 == no_of_questions) {
        _currentQuestion = data['questionNumber'];
      } else
        _currentQuestion = data['questionNumber'] + 1;

      loading = false;
    });
  }

  void _nextQuestion(String answer, int index) async {
    setState(() {
      loading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('planForm')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('question')
          .doc('${index + 1}')
          .set(
        {
          'answer': answer,
        },
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(
        {
          'healthState': 'false',
          'questionNumber': index + 1,
        },
      );
      SleepDiseaseProvider().checkAndSave(index + 1);
    } catch (err) {
      print(err.toString());
    }
    setState(() {
      loading = false;
    });

    if (_currentQuestion < no_of_questions - 1) {
      setState(() {
        _answers[index] = answer;
        _currentQuestion++;
      });
    } else {
      var result = 'healthy';
      var disease = await FirebaseFirestore.instance
          .collection("planForm")
          .doc(id)
          .collection("stats")
          .doc(id)
          .get();
      if (disease['apnea'] >= 20)
        result = 'apnea';
      else if (disease['insomia'] >= 20)
        result = 'insomia';
      else if (disease['sleep_deprivation'] >= 20) result = 'sleep deprivation';
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(
        {
          'healthState': 'true',
          'diseaseType': result,
          'isReady': 'false',
          'questionNumber': _currentQuestion + 1,
        },
      );

      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestion--;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (once) getQuestion();
    var notificationBarHeight = MediaQuery.of(context).padding.top;

    final List<Widget> forms_details = [
      InputBox(
        key: Key('1'),
        question: 'What\'s your birthdate?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.DateInput,
      ),
      InputBox(
        key: Key('2'),
        question: 'What\'s your height?(Enter in cms)',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
        min: 30,
        max: 220,
      ),
      InputBox(
        key: Key('3'),
        question: 'What\'s your weight?(Enter in kgs)',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
        min: 10,
        max: 150,
      ),
      McqWidget(
        key: Key('4'),
        question: 'What\'s your gender?',
        options: const ['Male', 'Female', 'Do not prefer to say'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('5'),
        question: 'How often do you take sleeping aids?',
        options: const [
          'Never',
          'Less than once a week',
          'Once or twice a week',
          'Three or more times a week',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('6'),
        question: 'How many cigarettes do you smoke per day?',
        options: const ['0', '1-5', '6-10', '11-20', '21-40'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      InputBox(
        question:
            'In general, how many hours of sleep do you need to feel refreshed during the day?',
        key: Key('7'),
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
      ),
      McqWidget(
        key: Key('8'),
        question:
            'In the past month, how often did you wake up earlier than you wanted and found it hard to fall back asleep?',
        options: const [
          'Never',
          'Rarely',
          'Occasionally',
          'Often',
          'Very often'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('9'),
        question:
            'To the best of your knowledge, how often do you snore at night?',
        options: const [
          'Never',
          'Rarely',
          'Occasionally',
          'Often',
          'Very often',
          'I don\'t know'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('10'),
        question: 'Have you ever been told that you snore loudly at night?',
        options: const [
          'Yes',
          'No',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('11'),
        question:
            'In general, how tired are you when you wake up in the morning?',
        options: const [
          'Not at all tired',
          'Little bit',
          'Occasionally very high',
          'Tired',
          'Extremely Tired'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('12'),
        question:
            'How often do you have headaches when you wake up in the morning?',
        options: const [
          'Never',
          'Rarely',
          'Occasionally',
          'Often',
          'Very often',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('13'),
        question:
            'How often is your mouth dry when you wake up in the morning?',
        options: const [
          'Never',
          'Rarely',
          'Occasionally',
          'Often',
          'Very often',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('14'),
        question:
            'In general, how refreshed do you feel when you wake up in the morning?',
        options: const [
          'Not at all refreshed',
          'Slightly',
          'Occasionally',
          'Mostly Refreshed',
          'Extremely Refreshed',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('15'),
        question:
            'How likely are you to fall asleep during the day when doing something active?',
        options: const [
          'Very unlikely',
          'A few times',
          'Sometimes',
          'Likely',
          'Very likely',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('16'),
        question:
            'How likely are you to fall asleep during the day when doing something passive, but not in a sleep position?',
        options: const [
          'Very unlikely',
          'A few times',
          'Sometimes',
          'Likely',
          'Very likely',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('17'),
        question:
            'How likely are you to fall asleep during the day when doing something passive, but in a sleep position?',
        options: const [
          'Very unlikely',
          'A few times',
          'Sometimes',
          'Likely',
          'Very likely',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      InputBox(
        key: Key('18'),
        question:
            'How would you rate your sleep quality?(Enter a number from 1 to 10)',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
        max: 10,
        min: 1
      ),
      InputBox(
        key: Key('19'),
        question:
            'In general, how much sleep do you get on a typical weeknight?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.HourMinuteInput,
      ),
      InputBox(
        key: Key('20'),
        question: 'When do you usually wake up on weekdays?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.HourMinuteInput,
      ),
      McqWidget(
        key: Key('21'),
        question:
            'In general, how easy is it for you to wake up at your desired time on weekdays?',
        options: const [
          'Very easy',
          'Easy',
          'Okayish',
          'Difficult',
          'Very difficult',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      InputBox(
        key: Key('22'),
        question: 'What time would you wake up if you didn\'t set an alarm?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.TimeInput,
      ),
      InputBox(
        key: Key('23'),
        question:
            'On average in the past month, how long did it take you to fall asleep on weeknights?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.HourMinuteInput,
      ),
      McqWidget(
        key: Key('24'),
        question:
            'In the past month, how many times did you typically wake up each night?',
        options: const [
          '0 times',
          '1-2 times',
          '3-5 times',
          '6-9 times',
          '10 times or more',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      InputBox(
        key: Key('25'),
        question:
            'When you woke up at night in the past month, how long were you usually awake for in total each night, in minutes? (If you didn\'t generally wake up, enter 0).',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
        min: 0,
        max: 500,
      ),
      InputBox(
        key: Key('26'),
        question: 'In general, how much sleep do you get on a typical weekend?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.HourMinuteInput,
      ),
      InputBox(
        key: Key('27'),
        question: 'When do you usually go to sleep on weekends?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.TimeInput,
      ),
      InputBox(
        key: Key('28'),
        question: 'When do you usually wake up on weekends?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.TimeInput,
      ),
      InputBox(
        key: Key('29'),
        question:
            'On average in the past month, how long did it take you to fall asleep on weekends?',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.TimeInput,
      ),
      McqWidget(
        key: Key('30'),
        question:
            'In general, how easy is it for you to wake up at your desired time on weekends?',
        options: const [
          'Very easy',
          'Easy',
          'Okayish',
          'Difficult',
          'Very difficult',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('31'),
        question:
            'What do you consider the best time of day for a complex task that requires attention and concentration?',
        options: const [
          '5:00AM - 8:00AM',
          '8:00AM - 11:00AM',
          '11:00AM - 2:00PM',
          '2:00PM - 5:00PM',
          '5:00PM - 8:00PM',
          '8:00PM - 11:00PM',
          '11:00PM - 2:00PM'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('32'),
        question: 'What do you consider yourself?',
        options: const ['Morning Person', 'Night Person', 'Neither'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('33'),
        question: 'In general, how anxious have you felt in the past month?',
        options: const [
          'Not at all anxious',
          'Little bit anxious',
          'Moderately anxious',
          'Highly Anxious',
          'Extremely Anxious'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('34'),
        question: 'In general, how depressed have you felt in the past month?',
        options: const [
          'Not at all depressed',
          'Little bit depressed',
          'Moderately depressed',
          'Highly depressed',
          'Extremely depressed'
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
    ];

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.of(context)
                              .popAndPushNamed(HomeScreen.routeName);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Theme.of(context).iconTheme.color,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      HomeScreenText(
                        text: 'Plan Creation Form',
                      ),
                      Container(
                        child: Image.asset('assets/form.gif'),
                        height: 150,
                        width: 150,
                      ),
                      if (loading)
                        CircularProgressIndicator(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      if (!loading)
                        Text(
                          'Question ${_currentQuestion + 1}/34',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      if (!loading) forms_details[_currentQuestion],
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

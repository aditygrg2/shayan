import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/form_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_buttons_with_icon.dart';
import 'package:night_gschallenge/widgets/form/InputBox.dart';
import 'package:night_gschallenge/widgets/form/mcq_widget.dart';
import 'package:provider/provider.dart';

class MainForm extends StatefulWidget {
  _MainFormState createState() => _MainFormState();
}

enum InputTypes { TimeInput, NumberInput, HourMinuteInput, DateInput }

class _MainFormState extends State<MainForm> {
  int _currentQuestion = 0;
  // Change if you are changing number of questions!
  int no_of_questions = 34;
  final _answers = List.filled(34, '');

  void _nextQuestion(String answer, int index) {
    if (_currentQuestion < no_of_questions) {
      setState(() {
        _answers[index] = answer;
        _currentQuestion++;
      });
    }

    print(_answers);
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestion--;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      InputBox(
        key: Key('3'),
        question: 'What\'s your weight?(Enter in kgs)',
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
      ),
      McqWidget(
        key: Key('4'),
        question: 'What\'s your gender?',
        options: ['Male', 'Female', 'Do not prefer to say'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('5'),
        question: 'How often do you take sleeping aids?',
        options: [
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
        options: ['0', '1-5', '6-10', '11-20', '21-40'],
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
        options: ['Never', 'Rarely', 'Occasionally', 'Often', 'Very often'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('9'),
        question:
            'To the best of your knowledge, how often do you snore at night?',
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: [
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
        options: ['Morning Person', 'Night Person', 'Neither'],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('33'),
        question: 'In general, how anxious have you felt in the past month?',
        options: [
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
        options: [
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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Image.asset('assets/form.gif'),
          Text('Question ${_currentQuestion + 1}'),
          forms_details[_currentQuestion],
        ],
      ),
    );
  }
}

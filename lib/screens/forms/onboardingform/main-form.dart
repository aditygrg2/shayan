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
  int no_of_questions = 9;
  final _answers = List.filled(9, '');

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
      McqWidget(
        question: 'Hey',
        options: [
          'A',
          'B',
          'C',
          'D',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('1'),
        question: 'Heya',
        options: [
          'AB',
          'BC',
          'CD',
          'DE',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      McqWidget(
        key: Key('2'),
        question: 'Hey',
        options: [
          'A',
          'B',
          'C',
          'D',
        ],
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
      ),
      InputBox(
        question: 'Input test',
        key: Key('3'),
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.TimeInput,
      ),
      InputBox(
        question: 'Input test',
        key: Key('4'),
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.HourMinuteInput,
      ),
      InputBox(
        question: 'Input test',
        key: Key('5'),
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.NumberInput,
        labels: 'Pankaj',
      ),
      InputBox(
        question: 'Input test',
        key: Key('6'),
        onPressedNext: _nextQuestion,
        currentQuestion: _currentQuestion,
        onPressedBack: _previousQuestion,
        inputType: InputTypes.DateInput,
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question ${_currentQuestion + 1}'),
              Icon(Icons.close),
            ],
          ),
          Image.asset('assets/form.gif'),
          forms_details[_currentQuestion],
        ],
      ),
    );
  }
}

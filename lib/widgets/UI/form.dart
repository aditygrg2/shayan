import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_buttons_with_icon.dart';
import 'package:night_gschallenge/widgets/form/mcq_widget.dart';

class SleepForm extends StatefulWidget {
  final num QuestionID;

  SleepForm({this.QuestionID = 1});

  @override
  State<SleepForm> createState() => _FormState();
}

class _FormState extends State<SleepForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question ${widget.QuestionID}'),
              Icon(Icons.close),
            ],
          ),
          McqWidget(
            question:
                "Do you have disturbing dreams that wake you up and make it difficult to fall back asleep?",
            options: [
              "Never",
              "Really",
              "Occassionally",
              'Very Often',
              "Often"
            ],
          ),
          Image.asset('assets/form.gif'),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButtonsWithIcon(icon: Icons.navigate_before_rounded, onPressed: null, title: "Back"),
              ElevatedButtonsWithIcon(icon: Icons.navigate_next_rounded, onPressed: null, title: "Next"),
            ],
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

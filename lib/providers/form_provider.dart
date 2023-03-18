import 'package:flutter/material.dart';

class MCQ {
  final String? questionID;
  final String? question;
  final List? options;

  MCQ({this.questionID, this.question, this.options});
}

// jbdaajwbs
class SleepFormProvider with ChangeNotifier {
  final List<dynamic> _formList = [
    MCQ(options: ["as", "as"], question: "asdsf", questionID: "1"),
    MCQ(options: ["as2", "as2"], question: "asds2f", questionID: "2"),
    MCQ(options: ["a213s", "as213"], question: "as23dsf", questionID: "3")
  ];
}

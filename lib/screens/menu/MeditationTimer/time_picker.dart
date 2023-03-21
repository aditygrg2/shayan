import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimePicker extends StatefulWidget {
  DateTime _dateTime = DateTime.now();
  Function callback;
  TimePicker(this.callback);
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(143, 227, 221, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TimePickerSpinner(
            is24HourMode: true,
            isShowSeconds: true,
            normalTextStyle: TextStyle(fontSize: 24, color: Colors.black12),
            highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.black),
            spacing: 45,
            itemHeight: 80,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                widget._dateTime = time;
                widget.callback(time);
              });
            },
          ),
        ),
      ),
    );
  }
}

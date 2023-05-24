import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimePicker extends StatefulWidget {
  DateTime _dateTime = DateTime.parse('1900-12-24 00:00:00.000');
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(250, 195, 68, 1),
            ),
          ),
          child: TimePickerSpinner(
            is24HourMode: true,
            isShowSeconds: true,
            time: widget._dateTime,
            normalTextStyle: TextStyle(fontSize: 24, color: Theme.of(context).disabledColor),
            highlightedTextStyle: TextStyle(fontSize: 28, color: Theme.of(context).secondaryHeaderColor),
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

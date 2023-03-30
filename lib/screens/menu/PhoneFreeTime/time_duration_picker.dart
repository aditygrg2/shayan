import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TimeDurationPicker extends StatefulWidget {
  String? time;
  Function callbackSetDuration;
  TimeDurationPicker(this.callbackSetDuration);
  @override
  State<TimeDurationPicker> createState() => _TimeDurationPickerState();
}

class _TimeDurationPickerState extends State<TimeDurationPicker> {
  List<String> optionList = [
    "10 Minutes",
    "20 Minutes",
    "30 Minutes",
    "40 Minutes",
    "60 Minutes",
    "90 Minutes",
    "120 Minutes",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: optionList.map<DropdownMenuItem<String>>((duration) {
        return DropdownMenuItem(
          value: duration,
          child: Container(padding: EdgeInsets.all(10), child: Text(duration)),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          widget.time = value ?? "";
          widget.callbackSetDuration(widget.time!.split(" ")[0]);
        });
      },
      value: widget.time,
      hint: Text('Select Duration'),
      dropdownColor: Colors.white,
      focusColor: Theme.of(context).canvasColor,
    );
  }
}

import 'package:flutter/material.dart';

Widget box(String? text, String optional, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    color: Theme.of(context).canvasColor,
    child: Text(
      text ?? optional,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}

class TimeBoxes extends StatelessWidget {
  String? hours;
  String? minutes;
  String? meridian;
  void Function()? onTap;

  TimeBoxes({this.hours, this.minutes, this.meridian, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          box(hours, '00', context),
          const Text(
            ':',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          box(minutes, '00', context),
          box(meridian, '', context),
        ],
      ),
    );
  }
}

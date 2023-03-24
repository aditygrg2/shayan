import 'package:flutter/material.dart';

class TimeLittleBox extends StatelessWidget {
  String? text;
  String? optional;
  BuildContext? context;

  TimeLittleBox({this.text, this.optional, this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Theme.of(context).canvasColor,
      child: Text(
        text ?? optional!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

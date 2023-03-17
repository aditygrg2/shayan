import 'package:flutter/material.dart';

class ElevatedButtonsWithIcon extends StatelessWidget {
  final Function? onPressed;
  final String? title;
  final IconData? icon;

  ElevatedButtonsWithIcon({this.onPressed, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [Icon(icon), Text(title!)],
        ),
      ),
    );
  }
}

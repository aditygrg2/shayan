import 'package:flutter/material.dart';

class HomeScreenText extends StatelessWidget {
  final text;
  TextStyle? theme;

  HomeScreenText({this.text, this.theme = null});

  @override
  Widget build(BuildContext context) {
    theme ??= Theme.of(context).textTheme.headlineLarge;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme ?? TextStyle(
              color: Theme.of(context).secondaryHeaderColor
            ),
          ),
        ],
      ),
    );
  }
}

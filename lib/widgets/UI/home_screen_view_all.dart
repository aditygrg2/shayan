import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';

class HomeScreenViewAll extends StatelessWidget {
  void Function()? onClick;

  HomeScreenViewAll({this.onClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onClick,
            child: Text(
              'View All',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

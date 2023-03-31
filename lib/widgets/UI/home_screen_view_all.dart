import 'package:flutter/material.dart';

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
            child: const Text(
              'View All',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

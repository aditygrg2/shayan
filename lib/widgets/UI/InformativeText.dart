import 'package:flutter/material.dart';

class InformativeText extends StatelessWidget {
  String? text;
  IconData? icon;
  InformativeText({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: (width - 40) * 0.9,
            child: Text(
              text!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        ],
      ),
    );
  }
}

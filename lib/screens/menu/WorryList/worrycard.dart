import 'package:flutter/material.dart';

class Worrycard extends StatelessWidget {
  final String? worry;
  final String? situation;
  Worrycard({this.worry, this.situation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: const Icon(
            Icons.list_alt_rounded,
            color: Colors.blue,
            size: 50,
          ),
        ),
        horizontalTitleGap: 10,
        tileColor: Colors.white,
        // contentPadding: EdgeInsets.all(10),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            worry!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Text(
          situation!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

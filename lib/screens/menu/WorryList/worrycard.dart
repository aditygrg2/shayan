import 'dart:math';

import 'package:flutter/material.dart';

IconData getRandomIcon() {
  final List<int> points = <int>[0xe0b0, 0xe0b1, 0xe0b2, 0xe0b3, 0xe0b4];
  final Random random = Random();
  const String chars = '0123456789ABCDEF';
  int length = 3;
  String hex = '0xe';
  while (length-- > 0) hex += chars[(random.nextInt(16)) | 0];
  return IconData(int.parse(hex), fontFamily: 'MaterialIcons');
}

class Worrycard extends StatelessWidget {
  final String? worry;
  final String? situation;
  Worrycard({this.worry, this.situation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
      child: ListTile(

        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            Icons.list_alt_rounded,
            color: Colors.blue,
            size: 50,
          ),
        ),
        horizontalTitleGap: 10,
        tileColor: Colors.white,
        // contentPadding: EdgeInsets.all(10),
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            worry!,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Text(situation!,
            style: TextStyle(
              fontSize: 14,
            )),
      ),
    );
  }
}

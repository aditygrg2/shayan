import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';

class MusicCategory extends StatelessWidget {
  List<Map<dynamic, dynamic>> data;
  String title;
  MusicCategory({required this.data, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(title),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...data.map((e) {
                  return LibraryCard(
                    heading: "sd",
                    subHeading: "sfds",
                    src: "acf",
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 
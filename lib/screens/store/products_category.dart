import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/sliding_card_rounded.dart';

class ProductCategory extends StatelessWidget {
  List<Map<dynamic, dynamic>> data;
  String type;
  ProductCategory({required this.data, required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeScreenText(text: "Shop by Category",),
        Container(
          height: 380,
          width: MediaQuery.of(context).size.width - 20,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              ...data.map((e) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 250,
                    height: 380,
                    margin: const EdgeInsets.all(10),
                    child: SlidingCardRounded(
                      heading: e['title'],
                      subHeading: null,
                      src: e['image'],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}

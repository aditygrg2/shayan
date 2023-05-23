import 'package:flutter/material.dart';
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
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            type,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
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
                      subHeading: "${e['price']}\n${e['description']}",
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

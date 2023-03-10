import 'package:flutter/material.dart';

class ImageWithTextCard extends StatelessWidget {
  final tune;
  ImageWithTextCard(this.tune);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Container(
              child: Text('image'),
            ),
            Container(
              child: Text(''), //'text displayed on Image'
            )
          ],
        ));
  }
}

class ReusableCardList extends StatefulWidget {
  @override
  State<ReusableCardList> createState() => _ReusableCardListState();
}

class _ReusableCardListState extends State<ReusableCardList> {
  final Reusables = ['a', 'b'];  // fetch data for the list will pass from above widget
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: Reusables.map((tune) {
        return ImageWithTextCard(tune);
      }).toList(),
    );
  }
}

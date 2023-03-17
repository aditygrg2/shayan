import 'package:flutter/material.dart';

class SlidingCardRounded extends StatelessWidget {
  final heading;
  final subHeading;
  final src;

  SlidingCardRounded({this.heading, this.subHeading, this.src});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subHeading,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

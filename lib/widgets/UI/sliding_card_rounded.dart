import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';

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
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2,
          ),
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: ImageCacher(
                  imagePath: src,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: Container(
                  color: Theme.of(context).buttonColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        child: Text(
                          heading,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (subHeading != null)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: Text(
                            subHeading,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

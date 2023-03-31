import 'package:flutter/material.dart';

class MenuHeroImage extends StatelessWidget {
  String? image;
  MenuHeroImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 200,
      child: Image.asset(
        image!,
        fit: BoxFit.contain,
      ),
    );
  }
}

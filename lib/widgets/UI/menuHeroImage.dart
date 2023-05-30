import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';

class MenuHeroImage extends StatelessWidget {
  String? image;
  MenuHeroImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 200,
      child: ImageCacher(
        imagePath: image!,
        fit: BoxFit.contain,
      ),
    );
  }
}

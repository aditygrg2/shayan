import 'package:flutter/material.dart';

class ImageWithText extends StatelessWidget {
  VoidCallback action;
  String imageUrl;
  String title;
  ImageWithText(
      {required this.action, required this.imageUrl,required this.title});

  @override
  Widget build(BuildContext context) {
    return  GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(title,textAlign: TextAlign.center,),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      );
    
  }
}

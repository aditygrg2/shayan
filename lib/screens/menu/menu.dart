import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String text;
  final String imagePath;
  const Menu({required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          gradient: const RadialGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 143, 227, 221),
          ], radius: 1),
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "${text}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            child: Image.asset(imagePath),
          )
        ],
      ),
    );
  }
}

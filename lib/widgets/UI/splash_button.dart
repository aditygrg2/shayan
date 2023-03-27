import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;

  SplashButton({this.text, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color.fromRGBO(0, 223, 192, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              child: Text(
                text!,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;

  SplashButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Theme.of(context).buttonColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 64,
              ),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

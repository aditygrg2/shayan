import 'package:flutter/material.dart';

class ElevatedButtonWithoutIcon extends StatelessWidget {
  final String? text;
  Function? onPressedButton;

  ElevatedButtonWithoutIcon({this.text, this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        onPressedButton!();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text!,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

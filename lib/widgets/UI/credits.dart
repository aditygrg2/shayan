import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButtonWithoutIcon(
          text: 'Close',
          onPressedButton: () => Navigator.of(context).pop(),
        ),
      ],
      icon: const Icon(
        Icons.apps,
        size: 50,
      ),
      elevation: 20,
      title: Center(
          child: Text(
        "Developed By",
        style: Theme.of(context).textTheme.headlineLarge,
      )),
      content: const SingleChildScrollView(
        child: Text(
          'Aditya Garg\nParteek Goyal\nJiya Mittal\nSumit Kevlani\n\nGoogle Developers Club NITJ - GDSC India\n\n\nGoogle Solution Challenge 2023',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

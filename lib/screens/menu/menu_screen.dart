import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/widgets/menu/text_to_speech.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/menu';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context){
    return TextToSpeechComponent();
  }
}
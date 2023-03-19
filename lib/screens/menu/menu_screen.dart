import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/widgets/menu/text_to_speech.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  @override
  Widget build(BuildContext context){
    return Center(
      child: TextToSpeechComponent(),
    );
  }
}
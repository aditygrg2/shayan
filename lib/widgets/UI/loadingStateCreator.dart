import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';

class LoadingStateCreator extends StatelessWidget {
  bool isCanvas;
  

  LoadingStateCreator({this.isCanvas=false});

  @override
  Widget build(BuildContext context){
    ThemeMode _theme = Main.of(context).getTheme();

    return Image.asset(
      _theme == ThemeMode.dark ? (isCanvas ? 'assets/loadingcanvasdark.gif' : 'assets/ln.gif') : isCanvas ? 'assets/loading.gif' : 'assets/processloading.gif', 
      fit: BoxFit.cover,
    );
  }
}
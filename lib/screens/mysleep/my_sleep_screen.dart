import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';

class MySleepScreen extends StatelessWidget {
  static const routeName = '/mySleep';
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body: Text('My Sleep Page'),
    );
  }
}
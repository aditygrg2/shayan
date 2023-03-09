import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';

class LibraryScreen extends StatelessWidget {
  static const routeName = '/library';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body: Text('Curating a beautiful list of sleep content!'),
    );
  }
}
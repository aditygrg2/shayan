import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Curating a beautiful list of sleep content!'),
    );
  }
}
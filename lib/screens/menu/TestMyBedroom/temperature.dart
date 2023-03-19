import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  static const routeName = 'menu/temperature';

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Temperature'),
    );
  }
}
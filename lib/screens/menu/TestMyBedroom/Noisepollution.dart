import 'package:flutter/material.dart';

class NoisePollution extends StatefulWidget {
  static const routeName = 'menu/noise';

  @override
  _NoisePollutionState createState() => _NoisePollutionState();
}

class _NoisePollutionState extends State<NoisePollution> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Noise'),
    );
  }
}
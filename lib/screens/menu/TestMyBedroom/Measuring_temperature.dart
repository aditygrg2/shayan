import 'package:flutter/material.dart';

class MeasuringTemperature extends StatefulWidget {

  @override
  _MeasuringTemperatureState createState() => _MeasuringTemperatureState();
}

class _MeasuringTemperatureState extends State<MeasuringTemperature> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Center(
            child: Text(
              'Please wait while we fetch the details for you...',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}

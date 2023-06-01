import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:provider/provider.dart';

class MeasuringLight extends StatefulWidget {

  @override
  _MeasuringLightState createState() => _MeasuringLightState();
}

class _MeasuringLightState extends State<MeasuringLight> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Center(
            child: Text(
              'Rotate your phone slowly',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ImageCacher(
            imagePath: "https://i.ibb.co/18QJbkV/output-onlinegiftools-29.gif",
            fit: BoxFit.cover,
          ),
          Center(
            child: Consumer<LightProvider>(
              builder: (context, value, child) {
                return Text(
                  '${value.LUX} lux',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

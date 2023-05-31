import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:provider/provider.dart';

class MeasuringNoise extends StatefulWidget {

  @override
  _MeasuringNoiseState createState() => _MeasuringNoiseState();
}

class _MeasuringNoiseState extends State<MeasuringNoise> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Center(
            child: Text(
              'Keep your phone steady',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ImageCacher(
            imagePath: "https://i.ibb.co/Bqjg50W/output-onlinegiftools-28.gif",
            fit: BoxFit.cover,
          ),
          Center(
            child: Consumer<NoiseProvider>(
              builder: (context, value, child) {
                return Text(
                  '${value.db.round()} dB',
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

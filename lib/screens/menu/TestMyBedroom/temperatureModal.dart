import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:provider/provider.dart';

class TemperatureModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherProvider>(context).dataValue;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: height * 0.6,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: height / 6,
                child: ImageCacher(imagePath:data['image']!),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '${data["temperature"]}°C, ${data["placename"]}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['heading']!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['subheading']!,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButtonWithoutIcon(
                text: 'Close',
                onPressedButton: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

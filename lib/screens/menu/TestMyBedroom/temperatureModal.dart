import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
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
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: height / 6,
                child: Image.asset(data['image']!),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '${data["temperature"]}°C, ${data["placename"]}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['heading']!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['subheading']!,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
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
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';

class LightModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<LightProvider>(context).dataValue;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
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
                height: height / 8,
                child: Image.asset(data['image']!),
              ),
              Text(
                data['heading']!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
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
                  Provider.of<LightProvider>(context, listen: false)
                      .stopListening();
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

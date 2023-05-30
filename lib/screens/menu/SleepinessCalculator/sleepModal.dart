import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';

class SleepModal extends StatelessWidget {
  dynamic data;
  SleepModal({this.data});
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 150,
            child: ImageCacher(imagePath: data['image']!),
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
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

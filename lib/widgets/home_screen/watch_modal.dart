import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/home_screen/watch_company_provider.dart';
import 'package:provider/provider.dart';

class WatchModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> watch_list = [
      {
        'title': 'Google Fit',
        'imagePath': 'assets/gfit.png',
        'subtitle': 'Connect to Google Fit via Google Authentication',
        'onPressed': Provider.of<WatchDataProvider>(context).getData
      },
      {
        'title': 'Samsung Health',
        'imagePath': 'assets/samsunghealth.png',
        'subtitle': 'Connect to Samsung Health'
      },
      {
        'title': 'Garmin',
        'imagePath': 'assets/garmin.png',
        'subtitle': 'Login to your garmin account'
      },
      {
        'title': 'Fitbit',
        'imagePath': 'assets/fitbit.png',
        'subtitle': 'Login to your fitbit account'
      },
    ];
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            'Connect your device',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ...watch_list.map((e) {
          return WatchCompanyProvider(
            title: e['title'],
            subtitle: e['subtitle'],
            imagePath: e['imagePath'],
            onPressed: e['onPressed'],
          );
        }).toList(),
        SizedBox(
          height: 20,
        ),
        ElevatedButtonWithoutIcon(
          text: 'Close',
          onPressedButton: Navigator.of(context).pop,
        )
      ],
    );
  }
}

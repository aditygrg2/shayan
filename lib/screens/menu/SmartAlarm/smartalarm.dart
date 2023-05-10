import 'dart:async';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Measuring_noise.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/noiseModal.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/permissionModal.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SmartAlarm extends StatefulWidget {
  static const routeName = 'smartalarm';

  @override
  _SmartAlarmState createState() => _SmartAlarmState();
}

class _SmartAlarmState extends State<SmartAlarm> {
  double recordedAverage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        TopRow(),
        HomeScreenText(
          text: "Smart Alarm",
        ),
        Center(
          child: ElevatedButtonWithoutIcon(
            text: "Measure",
            onPressedButton: () async {
              var permit = await Permission.microphone.status;

              if (permit == PermissionStatus.permanentlyDenied ||
                  permit == PermissionStatus.denied) {
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return PermissionModal(
                      permissionName: 'Microphone',
                      icon: Icons.mic,
                    );
                  },
                );
              } else if (permit == PermissionStatus.granted) {
                Provider.of<NoiseProvider>(context, listen: false)
                    .initPlatformState();
              } else {
                await Permission.microphone.request();
              }
            },
          ),
        ),

        Consumer<NoiseProvider>(
          builder: (context, value, child) {
            if (value.state && !value.success) {
              return MeasuringNoise();
            } else if (value.success == true && value.state == false) {
              recordedAverage = value.db;
              return Center(
                  child: Text(
                value.db.toString(),
              ));
            } else {
              return const Card();
            }
          },
        ),

        // The value shown in db now, is the value average of room right now. Irrespective of noise, now here feedback can be shown but the user should be able to continue

        Column(
          children: [
            Text(
              "Let's set up your alarm",
            ),
            
          ],
        )

        // Asking user his scheduled alarm range, the design needs here

        // Now alarm is done, I have a time range, where user wants to wake up.

        // Locking this app would be required.

        // After clicking on setAlarm, this will run, as soon as the user sleeps, assuming 15 mins after it starts
      ],
    ));
  }
}

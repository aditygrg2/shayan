import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';


import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/smart_alarm_provider.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Measuring_noise.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/noiseModal.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/permissionModal.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:night_gschallenge/widgets/form/InputBox.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class SmartAlarm extends StatefulWidget {
  static const routeName = 'smartalarm';

  @override
  _SmartAlarmState createState() => _SmartAlarmState();
}

class _SmartAlarmState extends State<SmartAlarm> {
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  late StreamSubscription<NoiseReading> _noiseSubscription;
  late StreamSubscription<NoiseReading> _noiseSubscription2;
  late NoiseMeter _noiseMeter;
  late NoiseMeter _noiseMeter2;

  Record recorder = Record();

  double recordedAverage = 0;
  double enhancer = 0;
  bool playerStarted = false;

  late dynamic appDir;

  double dbOnScreen = 0;

  List<double>average_points = [];

  void checkAfterStartRecording(NoiseReading noiseReading) async {
    average_points.add(noiseReading.meanDecibel);

    if(average_points.length > 10){
      double average = average_points.sum/average_points.length;

      if(average < recordedAverage + 30){
        String? pathOfRecordedFile = await recorder.stop();
        print(pathOfRecordedFile);
        _noiseSubscription.resume();
        _noiseSubscription2.pause();
        average_points.clear();
      }
    }
  }

  void onData(NoiseReading noiseReading) async {
    print(noiseReading.meanDecibel);
    dbOnScreen = noiseReading.meanDecibel;

    if(dbOnScreen > recordedAverage + 20){
      _noiseSubscription.pause();

      appDir = await syspaths.getExternalStorageDirectory();

      recorder.start(
        path: '${appDir.path}/${DateTime.now().millisecond}.m4a'
      );

      _noiseMeter2 = NoiseMeter();
      _noiseSubscription2 = _noiseMeter.noiseStream.listen(checkAfterStartRecording);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(),
          HomeScreenText(
            text: "Smart Alarm",
          ),

          // Launch a popup with Smart Alarm info here

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
                  // ignore: use_build_context_synchronously
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter you start time",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                key: ValueKey("Start Value"),
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: Time(
                        hour: TimeOfDay.now().hour,
                        minute: TimeOfDay.now().minute,
                      ),
                      onChange: (pickedDate) {
                        num? something = pickedDate.hour;
                        String? hour = something > 12
                            ? (something - 12).toString()
                            : pickedDate.hour.toString();
                        String? minutes = pickedDate.minute.toString();
                        String? mode = something > 12 ? 'PM' : 'AM';
                        _startTimeController.text = '$hour:$minutes $mode';
                      },
                    ),
                  );
                },
                controller: _startTimeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter you end time",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                key: ValueKey("End Value"),
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: Time(
                        hour: TimeOfDay.now().hour,
                        minute: TimeOfDay.now().minute,
                      ),
                      onChange: (pickedDate) {
                        num? something = pickedDate.hour;
                        String? hour = something > 12
                            ? (something - 12).toString()
                            : pickedDate.hour.toString();
                        String? minutes = pickedDate.minute.toString();
                        String? mode = something > 12 ? 'PM' : 'AM';
                        _endTimeController.text = '$hour:$minutes $mode';
                      },
                    ),
                  );
                },
                controller: _endTimeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButtonWithoutIcon(
                  text: "Set Alarm",
                  onPressedButton: () {
                    // show that alarm has been set, dim the lights, and ask user if he wants to play something
                    _noiseMeter = NoiseMeter();
                    _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
                    recorder = Record();
                  },
                ),
              ),
              Center(
                child: ElevatedButtonWithoutIcon(
                  text: "Stop Alarm",
                  onPressedButton: () {
                    // show that alarm has been set, dim the lights, and ask user if he wants to play something
                    _noiseSubscription2.cancel();
                    _noiseSubscription.cancel();
                  },
                ),
              ),
            ],

            // Locking this app would be required.

            // After clicking on setAlarm, this will run, as soon as the user sleeps, assuming 15 mins after it starts
          )
        ],
      ),
    );
  }
}

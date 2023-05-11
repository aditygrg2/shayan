import 'dart:async';
import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:collection/collection.dart';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/smart_alarm_provider.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Measuring_noise.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/permissionModal.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
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
  TimeOfDay startTime = Time(hour: 20, minute: 0);
  TimeOfDay endTime = Time(hour: 7, minute: 0);

  double modifier = 10;

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

  List<double> average_points = [];
  List<double> alarm_average_points = [];

  void checkAfterStartRecording(NoiseReading noiseReading) async {
    average_points.add(noiseReading.meanDecibel);
    alarm_average_points.add(noiseReading.meanDecibel);
    print(noiseReading.meanDecibel);
    _noiseSubscription2.pause();

    if (average_points.length > 50) {
      double average = average_points.sum / average_points.length;

      print("Average: ");
      print(average);
      print("Recorded Average");
      print(recordedAverage);

      if (average < (recordedAverage + modifier) && noiseReading.meanDecibel<recordedAverage) {
        if (await recorder.isRecording()) {
          String? pathOfRecordedFile = await recorder.stop();
          _noiseSubscription2.cancel();
        }
        _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
      }

      average_points.clear();
    }

    TimeOfDay currentTime = TimeOfDay.now();
    double timeNow = currentTime.hour + currentTime.minute / 60;
    double timePrev = startTime.hour + startTime.minute / 60;
    double timeNext = endTime.hour + endTime.minute / 60;

    if (timeNow > timePrev && timeNow < timeNext) {
      if (alarm_average_points.length > 100) {
        double avg = alarm_average_points.sum / alarm_average_points.length;

        if (avg > recordedAverage + modifier) {
          if (await recorder.isRecording()) {
            _noiseSubscription2.cancel();
          } else {
            _noiseSubscription.cancel();
          }
          recorder.stop();

          Provider.of<AudioProvider>(context, listen: false).setAlarm('assets/beach.mp3');
        }

        alarm_average_points.clear();
      }
    }

    _noiseSubscription2.resume();
  }

  void onData(NoiseReading noiseReading) async {
    _noiseSubscription.pause();
    print(noiseReading.meanDecibel);
    dbOnScreen = noiseReading.meanDecibel;
    alarm_average_points.add(dbOnScreen);

    if (dbOnScreen > recordedAverage + modifier) {
      print("dbOnScreen is higher than average, event cancelled");
      _noiseSubscription.cancel();
      appDir = await syspaths.getExternalStorageDirectory();
      print(appDir.path);
      appDir = await Directory(appDir.path).create(recursive: true);

      if (!await recorder.isRecording()) {
        recorder.start(
          path: '${appDir.path}/${DateTime.now()}.m4a',
        );
      }

      _noiseMeter2 = NoiseMeter();
      _noiseSubscription2 =
          _noiseMeter.noiseStream.listen(checkAfterStartRecording);
      print("Another event started");
    }

    _noiseSubscription.resume();
  }

  @override
  Widget build(BuildContext context) {
    Alarm.init();
    Provider.of<SmartAlarmProvider>(context, listen: false).getPaths();
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
                        setState(() {
                          startTime = pickedDate.toTimeOfDay();
                        });
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
                        setState(() {
                          endTime = pickedDate.toTimeOfDay();
                        });
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
                  onPressedButton: () async {
                      _noiseMeter = NoiseMeter();
                      _noiseSubscription =
                          _noiseMeter.noiseStream.listen(onData);
                      recorder = Record();
                  },
                ),
              ),
              Center(
                child: ElevatedButtonWithoutIcon(
                  text: "Stop Alarm",
                  onPressedButton: () async {
                    // show that alarm has been set, dim the lights, and ask user if he wants to play something
                    if (await recorder.isRecording()) {
                      _noiseSubscription2.cancel();
                    } else {
                      _noiseSubscription.cancel();
                    }
                    recorder.stop();
                  },
                ),
              ),

              //Listing all the files here for the moment
              Consumer<SmartAlarmProvider>(
                builder: (context, value, child) {
                  if (value.files.length == 0) {
                    return Text("No recordings available");
                  }
                  return Column(
                    children: value.files.map((file) {
                      return Text(file.toString());
                    }).toList(),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/smart_alarm_provider.dart';
import 'package:night_gschallenge/widgets/UI/image_cacher.dart';
import 'package:night_gschallenge/widgets/UI/smart_players.dart';
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

  void deleteRecordings(fileName) async {

    Directory? appDir = await syspaths.getExternalStorageDirectory();

    if(appDir==null){
      print("No path exists");
    }    

    String path = appDir!.path;
    try{
      File("$fileName").delete();

      var smartProvider = Provider.of<SmartAlarmProvider>(context, listen: false);

      smartProvider.files.removeWhere((element) {
            print(element.toString() == fileName);
        return element.toString() == fileName;
      });

      smartProvider.notifyEveryone();
    } catch(e){
      print(e);
    }
  }

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

      if (average < (recordedAverage + modifier) &&
          noiseReading.meanDecibel < recordedAverage) {
        if (await recorder.isRecording()) {
          String? pathOfRecordedFile = await recorder.stop();
          _noiseSubscription2.cancel();

          // Recomputing averages after stopping because as time goes ahead.
          Provider.of<NoiseProvider>(context, listen: false)
              .initPlatformState();

          recordedAverage = Provider.of<NoiseProvider>(context, listen: false)
              .average_data_points;
        }

        _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
      }

      average_points.clear();
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
    Provider.of<SmartAlarmProvider>(context, listen: false).getPaths();
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
            profile: true,
          ),
          HomeScreenText(
            text: "Smart Alarm",
          ),
          ImageCacher(
            imagePath: "https://i.ibb.co/3yf3gr0/Pngtree-clock-eps-8928529.png",
          ),
          Consumer<NoiseProvider>(
            builder: (context, value, child) {
              if (value.state && !value.success) {
                return Text(
                  "Maintain the lowest noise in the room. Tracing the environment. Please wait...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 24,
                  ),
                );
              } else if (value.success == true && value.state == false) {
                recordedAverage = value.db;
                _noiseMeter = NoiseMeter();
                _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
                recorder = Record();
                return Text(
                  "Smart Recorder is running...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 24,
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Smart Alarm is Off",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 24,
                    ),
                  ),
                );
              }
            },
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: ElevatedButtonWithoutIcon(
                    text: "Start Alarm",
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
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              actions: [
                                ElevatedButtonWithoutIcon(
                                  text: 'Continue',
                                  onPressedButton: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ],
                              icon: Icon(
                                Icons.battery_charging_full_outlined,
                                size: 50,
                              ),
                              elevation: 20,
                              title: Center(
                                  child: Text(
                                "Plug in your device",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              )),
                              content: Text(
                                'Plug in your device and keep it as close as possible. Once done, tap on continue.',
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        )
                            .then(
                          (value) =>
                              Provider.of<NoiseProvider>(context, listen: false)
                                  .initPlatformState(),
                        )
                            .then(
                          (value) async {
                            const androidConfig =
                                FlutterBackgroundAndroidConfig(
                              notificationTitle: "App is running in background",
                              notificationText:
                                  "Smart Alarm is analyzing your surroundings",
                              notificationImportance:
                                  AndroidNotificationImportance.Default,
                              notificationIcon: AndroidResource(
                                name: 'background_icon',
                                defType: 'drawable',
                              ),
                            );
                            await FlutterBackground.initialize(
                              androidConfig: androidConfig,
                            ).then(
                              (value) async {
                                if (value) {
                                  await FlutterBackground
                                      .enableBackgroundExecution();
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        actionsAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        actions: [
                                          ElevatedButtonWithoutIcon(
                                            text: 'Background Permissions',
                                            onPressedButton: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ],
                                        icon: Icon(
                                          Icons.battery_charging_full_outlined,
                                          size: 50,
                                        ),
                                        elevation: 20,
                                        title: Center(
                                            child: Text(
                                          "Allow the app to be run on background",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        )),
                                        content: Text(
                                          'This app needs to be run on background in order to analyze your sleep correctly.',
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  ).then((value) async {
                                    await FlutterBackground
                                        .enableBackgroundExecution();
                                  });
                                }
                              },
                            );
                          },
                        );
                      } else {
                        await Permission.microphone.request();
                      }
                    },
                  ),
                ),

                // The value shown in db now, is the value average of room right now. Irrespective of noise, now here feedback can be shown but the user should be able to continue

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
                      FlutterBackground.initialize().then((value) async {
                        if (value) {
                          await FlutterBackground.disableBackgroundExecution();
                        }
                      });
                      Provider.of<NoiseProvider>(context, listen: false)
                          .toggleSuccess();
                    },
                  ),
                ),
              ],
            ),
          ),

          //Listing all the files here for the moment
          HomeScreenText(
            text: "Recordings",
          ),
          Consumer<SmartAlarmProvider>(
            builder: (context, value, child) {
              if (value.files.length == 0) {
                return Text("No recordings available");
              }

              return Column(
                children: [
                  ...value.files.map(
                    (values) => SmartPlayers(values.toString(), deleteRecordings),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

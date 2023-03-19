import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:collection/collection.dart';


class NoiseProvider with ChangeNotifier {
  late StreamSubscription<NoiseReading> _noiseSubscription;
  late NoiseMeter _noiseMeter;
  List<double>data_points = [];
  double average_data_points = 100;
  bool success = false;
  double dbOnScreen = 100;
  bool state = false;

  void start() async {
      _noiseMeter =  NoiseMeter();
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
  }

  double get db{
    return dbOnScreen;
  }

  final List<Map<String,String>> _modalData = [
    {
      "image": "assets/goodlight.png",
      "heading" : "Great! Your average lux is below 05",
      "subheading": "You got the perfect bedroom light intensity for sleep! Happy sleeping",
    },
    {
      "image": "assets/averagelight.png",
      "heading" : "Good! Your average lux is between 05 and 20",
      "subheading": "Your bedroom light intensity is good for sleeping,try to keep it under 5 for best conditions",
    },
    {
      "image": "assets/badlight.png",
      "heading" : "Your average lux is above 20. You can do better!",
      "subheading": "Your bedroom light intensity is not apt for sleeping, improve to keep it below 20",
    },
  ];

  Map<String,String> get dataValue{
    if(average_data_points<=5){
      return _modalData[0];
    }
    else if(average_data_points<20 && average_data_points>5){
      return _modalData[1];
    }

    return _modalData[2];
  }

  void onData(NoiseReading noiseReading) {
    dbOnScreen = noiseReading.meanDecibel;
    
    notifyListeners();
    data_points.add(dbOnScreen);

    if (data_points.length >= 5) {
      final sum = data_points.sum;
      average_data_points = sum/data_points.length;
      stopRecorder();
      state = false;
      success = true;
      data_points.clear();
      notifyListeners();
    }
  }

  void onError(Object error) {
    print(error.toString());
  }

  void stopRecorder() async {
      if (_noiseSubscription != null) {
        _noiseSubscription.cancel();
        success = false;
        notifyListeners();
      }
  }

  Future<void> initPlatformState() async {
    start();
    state = true;
    notifyListeners();
  }
}

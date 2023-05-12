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
      "heading" : "Sweet Dreams!",
      "subheading": "Sleep tight! Your environment noise level is optimal for a restful slumber.",
    },
    {
      "image": "assets/averagelight.png",
      "heading" : "Sleep Tight!",
      "subheading": "A quiet hum in the air... Your environment noise level is suitable for sleeping, but for optimal conditions try to reduce the sound volumes",
    },
    {
      "image": "assets/badlight.png",
      "heading" : "Wake Up Call!",
      "subheading": "Wakey-wakey! Your environment noise level is too high for sleeping. Please look around and shut down the disturbances",
    },
  ];

  Map<String,String> get dataValue{
    if(average_data_points<=30){
      return _modalData[0];
    }
    else if(average_data_points<50 && average_data_points>30){
      return _modalData[1];
    }

    return _modalData[2];
  }

  void onData(NoiseReading noiseReading) {
    dbOnScreen = noiseReading.meanDecibel;
    
    notifyListeners();
    data_points.add(dbOnScreen);

    if (data_points.length >= 50) {
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

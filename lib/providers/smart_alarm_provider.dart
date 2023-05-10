import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';

class SmartAlarmProvider extends ChangeNotifier {
  late StreamSubscription<NoiseReading> _noiseSubscription;
  late NoiseMeter _noiseMeter;

  double dbOnScreen = 0;

  double get db {
    return dbOnScreen;
  }

  void start() async {
    
  }

  

  void stop() {
    // Close the streamer when alarm hits
    if (_noiseSubscription != null) {
      _noiseSubscription.cancel();
      notifyListeners();
    }
  }

  
}

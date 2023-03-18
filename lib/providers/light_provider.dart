import 'package:flutter/material.dart';
import 'package:light/light.dart';
import 'dart:async';


class LightProvider with ChangeNotifier{
  late Light _light;
  late StreamSubscription _subscription;

  void startListening() {
    _light = Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
  }

  void onData(int luxValue) async {
    print(luxValue);
  }

  Future<void> initPlatformState() async {
    startListening();
  }

}
import 'package:flutter/material.dart';
import 'package:light/light.dart';
import 'package:collection/collection.dart';
import 'dart:async';


class LightProvider with ChangeNotifier{
  late Light _light;
  late StreamSubscription _subscription;
  List<int>data_points = [];
  double average_data_points = 100;
  bool success = false;
  int luxOnScreen = 0;
  bool state = false;

  final List<Map<String,String>> _modalData = [
    {
      "image": "https://i.ibb.co/ScJPjfK/goodlight.png",
      "heading" : "Great! Your average lux is below 05",
      "subheading": "You got the perfect bedroom light intensity for sleep! Happy sleeping",
    },
    {
      "image": "https://i.ibb.co/FX6Tybs/averagelight.png",
      "heading" : "Good! Your average lux is between 05 and 20",
      "subheading": "Your bedroom light intensity is good for sleeping,try to keep it under 5 for best conditions",
    },
    {
      "image": "https://i.ibb.co/ccyj6bW/badlight.png",
      "heading" : "Your average lux is above 20. You can do better!",
      "subheading": "Your bedroom light intensity is not apt for sleeping, improve to keep it below 20",
    },
  ];


  int get LUX{
    return luxOnScreen;
  }

  void startListening() {
    _light = Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  Map<String,String> get dataValue{
    if(average_data_points<=5){
      return _modalData[0];
    }
    else if(average_data_points<20 && average_data_points>5){
      return _modalData[1];
    }

    return _modalData[2];
  }

  void stopListening() {
    success = false;
    notifyListeners();
    _subscription.cancel();
  }

  void onData(int luxValue) async {
    luxOnScreen = luxValue;
    notifyListeners();

    data_points.add(luxValue);

    if (data_points.length >= 50) {
      final sum = data_points.sum;
      average_data_points = sum/data_points.length;
      stopListening();
      state = false;
      success = true;
      data_points.clear();
      notifyListeners();
    }
  }

  Future<void> initPlatformState() async {
    startListening();
    state = true;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';

class ScreenBrightnessProvider extends ChangeNotifier {
  Future<double> get currentBrightness async {
    try {
      var result= await ScreenBrightness().current;
      print(result);
      return result;
    } catch (e) {
      print(e);
      throw 'Failed to get current brightness';
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      print(e);
      throw 'Failed to reset brightness';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  Location location = Location();
  late bool _serviceEnabled;
  late LocationData _locationData;


  Future<void> initPlatformState() async {
    initialize();
  }

  double get latitude{
    return _locationData.latitude!;
  }

  double get longitude{
    return _locationData.longitude!;
  }

  Future initialize() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // error net is not on!
        return;
      }
    }

    _locationData = await location.getLocation();
  }
}

import 'package:flutter/material.dart';
import 'package:health/health.dart';

class WatchData extends ChangeNotifier{
  HealthFactory health = HealthFactory();

  var types = [
    HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.SLEEP_IN_BED,
  ];

  Future getData() async {
    var permissions = [
      HealthDataAccess.READ,
    ];


    bool requested = await health.requestAuthorization(types, permissions: permissions);

    if(requested){
      var now = DateTime.now();

      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      now.subtract(Duration(days: 1)), now, types);

      print(healthData);
    }


  }

}
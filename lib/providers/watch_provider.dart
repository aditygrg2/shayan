import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class WatchDataProvider extends ChangeNotifier {
  HealthFactory health = HealthFactory();

  var types = [
    HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.HEIGHT,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_ASLEEP    
  ];

  Future<bool> getPermission()async{
    return await health.requestAuthorization(types);
  }

  Future getData() async {
    var permissions = [
      HealthDataAccess.READ,
    ];

    var permit = await Permission.activityRecognition.request();

    var now = DateTime.now();
    print(permit);

    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      now.subtract(Duration(days: 100)),
      now,
      types,
    );
    
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight.subtract(Duration(days: 2)), now);

    print(healthData);

  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class WatchDataProvider extends ChangeNotifier {
  HealthFactory health = HealthFactory();

  bool permissionEnabled = false;
  
  int sleep_in_bed = 0;
  int sleep_awake = 0;
  int sleep_asleep = 0;
  int height = 0;
  DateTime? sleptOn;
  DateTime? sleptTill;

  var types = [
    HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.HEIGHT,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_ASLEEP,
  ];

  Future<bool> getPermission()async{
    permissionEnabled = await health.requestAuthorization(types);
    return permissionEnabled;
  }

  int get SIB{
    return sleep_in_bed;
  }

  int get asleep{
    return sleep_asleep;
  }

  int get user_height{
    return height;
  }

  int get SA{
    return sleep_awake;
  }

  Future revoke() async {
    await health.revokePermissions();
  }

  Future getData(time) async {
    var permissions = [
      HealthDataAccess.READ,
    ];

    await Permission.activityRecognition.request();

    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      time.subtract(const Duration(days: 1)),
      time,
      types,
    );

    List<dynamic> list = healthData.toList();
    
    sleptOn = null;
    sleptTill = null;
    sleep_in_bed = 0;
    sleep_awake = 0;
    sleep_asleep = 0;  
    
    list.forEach((element) {
      String value = element.toJson()['data_type'];
      if(value =='SLEEP_IN_BED'){
        sleptOn = DateTime.parse(element.toJson()['date_from']);
        sleptTill = DateTime.parse(element.toJson()['date_to']);
        sleep_in_bed = double.parse(element.toJson()['value']['numericValue']).toInt();
      }

      else if(value == 'HEIGHT'){
        height = double.parse(element.toJson()['value']['numericValue']).toInt();
      }

      else if(value == 'SLEEP_AWAKE'){
        sleep_awake = double.parse(element.toJson()['value']['numericValue']).toInt();
      }

      else if(value == 'SLEEP_ASLEEP'){
        sleep_asleep = double.parse(element.toJson()['value']['numericValue']).toInt();
      }
    });
    
    notifyListeners();
  }
}

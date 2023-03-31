import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SleepElements extends ChangeNotifier {
  DateTime? wakeUpTime;
  DateTime? RealWakeUpTime;
  DateTime? RealSleepingTime;
  int? actualBedTime;
  int? TST;
  int? WFN;
  int? SL;
  int? WASO; // can be negative, more sleep than required. Do not deduct points.
  int? WASF;
  int? SE;
  int? tempSleep;
  int? ST;
  dynamic? data;
  int? TIB;
  
  bool? ssCreated = false;
  bool shouldCheck = false;

  // AST - Average Sleep Time

  void getData(a, b, c, d, e, f, length) async {
    wakeUpTime = DateFormat.jm().parse(e!);
    RealWakeUpTime = DateFormat.jm().parse(f!);
    RealSleepingTime =
        DateFormat.jm().parse(a!).add(Duration(minutes: int.parse(b!)));
    actualBedTime = RealWakeUpTime!.difference(RealSleepingTime!).inMinutes;
    if (actualBedTime! < 0) {
      actualBedTime = actualBedTime! + 24 * 60;
    }
    tempSleep = wakeUpTime?.difference(RealSleepingTime!).inMinutes;
    if (tempSleep! < 0) {
      tempSleep = tempSleep! + 24 * 60;
    }
    TST = tempSleep! - int.parse(d!);
    WFN = int.parse(c!);
    SL = int.parse(b!);
    WASO = (7 * 60 -
        TST!); // can be negative, more sleep than required. Do not deduct points.
    WASF = RealWakeUpTime?.difference(wakeUpTime!).inMinutes;
    SE = ((TST! / actualBedTime!) * 100).round();
    TIB = RealWakeUpTime!.difference(DateFormat.jm().parse(a!)).inMinutes;
    if (TIB! < 0) {
      TIB = TIB! + 24 * 60;
    }
  }

  int get sleepScore {
    return data['SS'];
  }

  int get sleepEfficiency {
    return data['SE'].round();
  }

  int get totalSleepTime {
    return data['TST'];
  }

  int get timeInBed {
    return data['TIB'];
  }

  int get awakenings {
    return data['WFN'];
  }

  bool get isSleepScorePresent {
    return ssCreated!;
  }

  Future getSleepElements() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    if (id != null) {
      final value = await FirebaseFirestore.instance.collection('users').doc(id).get();

      if (value['SSCreated'] == true) {
        await FirebaseFirestore.instance
            .collection('sleepData')
            .doc(id)
            .get()
            .then((value) {
          if (value != null) {
            data = value;
          }
        });

        print(sleepScore);
        ssCreated = true;
        shouldCheck = false;
      } else {
        ssCreated = false;
      }
    }
  }
}

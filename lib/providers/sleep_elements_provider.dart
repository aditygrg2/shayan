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
  double? SE;
  int? tempSleep;
  int? ST;

  // AST - Average Sleep Time

  void getData(a, b, c, d, e, f, length) async {
    wakeUpTime = DateFormat.jm().parse(e!);
    RealWakeUpTime = DateFormat.jm().parse(f!);
    RealSleepingTime = DateFormat.jm().parse(a!).add(Duration(minutes: int.parse(b!)));
    actualBedTime = DateFormat.jm().parse(f!).difference(RealWakeUpTime!).inMinutes;
    tempSleep = RealSleepingTime?.difference(wakeUpTime!).inMinutes;
    TST = tempSleep! - int.parse(d!);
    WFN = int.parse(c!);
    SL = int.parse(b!);
    WASO = (7 - TST!); // can be negative, more sleep than required. Do not deduct points.
    WASF = RealWakeUpTime?.difference(wakeUpTime!).inMinutes;
    SE = TST! / actualBedTime!;
  }
  
}

import 'package:flutter/material.dart';

class TimelineProvider extends ChangeNotifier{
  List<Map<dynamic, dynamic>> timeline = [
    {"time": "08:00", "task": "I will wake up at 8 am"},
    {"time": "16:00", "task": "I will wake up at 8 am"},
    {"time": "17:00", "task": "I will wake up at 8 am"},
    {"time": "17:00", "task": "I will wake up at 8 am"},
    {"time": "18:00", "task": "I will wake up at 8 am"},
    {"time": "18:34", "task": "I will wake up at 8 am"},
    {"time": "19:40", "task": "I will wake up at 8 am"},
    {"time": "20:00", "task": "I will wake up at 8 am"},
  ];

  List<Map<dynamic,dynamic>> get getTimeline{
    return [...timeline];
  }

  void editTimeline(int index,String time,String task){
    timeline[index]={
      "time":time,
      "task":task
    };
    timeline.sort((a,b) => (a['time'] as String).compareTo(b['time']));
    notifyListeners();
  }

  void addTimeline(String time,String task){
    timeline.add({"time":time,"task":task});
    timeline.sort((a,b) => (a['time'] as String).compareTo(b['time']));
    notifyListeners();
  }
}
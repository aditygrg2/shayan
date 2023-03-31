import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';

class TimelineProvider extends ChangeNotifier{
  List<Map<dynamic, dynamic>> timeline = [
    {"time": "06:30", "task": "Wake Up"},
    {"time": "06:45", "task": "Meditation or Excerise","suggestion":{
      "route":MeditationTimer.routeName,
    }},
    {"time": "14:00", "task": "Relax your Mood","suggestion":{
      "route":MusicTherapy.routeName,
    }},
    {"time": "19:00", "task": "Eat Light Dinner","suggestion":{
      "route":SleepDietSuggestion.routeName,
    }},
    {"time": "21:00", "task": "Test Your Environment","suggestion":{
      "route":TestMyBedroom.routeName,
    }},
    {"time": "21:15", "task": "Listen Music or Reading Articles","suggestion":{
      "route":ArticlesScreen.routeName,
    }},
    {"time": "21:45", "task": "Go to Sleep"},
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
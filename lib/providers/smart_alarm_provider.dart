import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class SmartAlarmProvider extends ChangeNotifier {
  List files = [];
  
  Future getPaths() async {
    Directory? appDir = await syspaths.getExternalStorageDirectory();

    if(appDir==null){
      print("No path exists");
    }    

    String path = appDir!.path;

    files = Directory("$path/").listSync();

    notifyListeners();
  }

  void notifyEveryone(){
    notifyListeners();
  }
}

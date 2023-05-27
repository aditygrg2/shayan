import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferencesProvider extends ChangeNotifier{
  late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setValue(stringmap, value)async{
    final data = json.encode(stringmap);
    prefs.setString(value, data);
  }

  void clear(){
    prefs.clear();
  }

  Object getValue(value, key){
    if(prefs.containsKey(value)){
      final extractedData = json.decode(prefs.getString(value)!) as Map<String, dynamic>;
      return extractedData[key];
    }

    return "";
  }

  bool checkIfPresent(value){
    if(prefs.containsKey(value)){
      return true;
    }
    return false;
  }
}
import 'package:flutter/material.dart';

class WorryListProvider with ChangeNotifier{
  List<Map<String,dynamic>>_worriesList = [];

  // Pattern of the object
  // Situation, worry, solutions, type

  void updateWorriesList(data){
    _worriesList.add(data);
    notifyListeners();
  }

  List<Map<String,dynamic>> get worryData{
    return _worriesList;
  }

  




}
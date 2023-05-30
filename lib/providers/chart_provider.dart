import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/bar_data.dart';

class ChartProvider extends ChangeNotifier {
  String? id = FirebaseAuth.instance.currentUser?.uid;
  List<BarData> showData = [];

  List<double> data = [0,0,0,0,0,0,0];

  Future getData() async {

    try {
    DateTime today = DateTime.now();
    final lastweek = today.subtract(Duration(days: today.weekday+7));
      for (int i = 1; i <= 7; i++) {
        var date = lastweek.add(Duration(days: i));
        final doc = await FirebaseFirestore.instance
        .collection('sleepData')
        .doc(id)
        .collection('dates')
        .doc(date.toString().split(" ")[0])
        .get();
        if(doc.exists && (doc.data() as Map).containsKey("TST") && doc.data()!['TST']!=null){
          double a = doc.data()!['TST']*1.0;
          while(a>8) a=a/8;
          data[date.weekday-1] = a;
        }
        else {
          data[date.weekday-1] = 0;
        }
      }
      print(data);
      List<BarData> barData = [
      BarData(
          color: Color.fromRGBO(69, 197, 197, data[0]),
          id: 0,
          name: "Mon",
          y: data[0]),
      BarData(
        color: Color.fromRGBO(114, 202, 192, data[1]),
        id: 1,
        name: "Tue",
        y: data[1],
      ),
      BarData(
          color: Color.fromRGBO(120, 237, 237, data[2]),
          id: 2,
          name: "Wed",
          y: data[2]),
      BarData(
          color: Color.fromRGBO(49, 225, 204, data[3]),
          id: 3,
          name: "Thu",
          y: data[3]),
      BarData(
          color: Color.fromRGBO(111, 201, 214, data[4]),
          id: 4,
          name: "Fri",
          y: data[4]),
      BarData(
          color: Color.fromRGBO(139, 196, 186, data[5]),
          id: 5,
          name: "Sat",
          y: data[5]),
      BarData(
          color: Color.fromRGBO(120, 237, 237, data[6]),
          id: 6,
          name: "Sun",
          y: data[6]),
    ];
    showData = barData;
    print(showData);
    notifyListeners();
    } catch (err) {
      print(err);
    }
    
  }

  bool data_NA_checker(){
    return showData.isEmpty;
  }

  List<BarData> get getChartData {
    return [...showData];
  }
}

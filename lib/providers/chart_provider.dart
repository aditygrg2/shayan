import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/bar_data.dart';

class ChartProvider extends ChangeNotifier {
  String? id = FirebaseAuth.instance.currentUser?.uid;
  List<BarData>? showData = [];

  List<double> data = [6, 8, 8, 4, 9, 11, 9];

  void getData() async {
    // final datasetValues = await FirebaseFirestore.instance
    //     .collection('sleepData')
    //     .doc(id)
    //     .collection('dates')
    //     .doc()
    //     .get();

    // DateTime now = DateTime.now();
    // try {
    //   // for (int i = 0; i < 7; i++) {
    //   //   var date = now.subtract(Duration(days: i));
    //   //   await FirebaseFirestore.instance
    //   //   .collection('sleepData')
    //   //   .doc(id)
    //   //   .collection('dates')
    //   //   .doc(date.toString().split(" ")[0])
    //   //   .set({});
    //   //   // ['TST']
    //   //   data[date.weekday] = datasetValues[date.toString().split(" ")[0]]['TST'];
    //   // }
    // } catch (err) {
    //   print(err);
    // }
    List<BarData> barData = [
      BarData(
          color: Color.fromRGBO(69, 197, 197, 1),
          id: 0,
          name: "Mon",
          y: data[0]),
      BarData(
        color: Color.fromRGBO(114, 202, 192, 1),
        id: 1,
        name: "Tue",
        y: data[1],
      ),
      BarData(
          color: Color.fromRGBO(120, 237, 237, 1),
          id: 2,
          name: "Wed",
          y: data[2]),
      BarData(
          color: Color.fromRGBO(49, 225, 204, 1),
          id: 3,
          name: "Thu",
          y: data[3]),
      BarData(
          color: Color.fromRGBO(111, 201, 214, 1),
          id: 4,
          name: "Fri",
          y: data[4]),
      BarData(
          color: Color.fromRGBO(139, 196, 186, 1),
          id: 5,
          name: "Sat",
          y: data[5]),
      BarData(
          color: Color.fromRGBO(120, 237, 237, 1),
          id: 6,
          name: "Sun",
          y: data[6]),
    ];

    showData = barData;
  }

  List<BarData> get getChartData {
    return [...showData!];
  }
}

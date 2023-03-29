
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/bar_data.dart';

class ChartProvider extends ChangeNotifier{
  List<BarData> barData=[
    BarData(color: Color.fromRGBO(69, 197, 197, 1), id: 0, name: "Mon", y: 5),
    BarData(color: Color.fromRGBO(114, 202, 192, 1), id: 1, name: "Tue", y: 5),
    BarData(color: Color.fromRGBO(120, 237, 237, 1)
, id: 2, name: "Wed", y: 4),
    BarData(color: Color.fromRGBO(49,225,204,1), id: 3, name: "Thu", y: 1),
    BarData(color: Color.fromRGBO(111, 201, 214, 1), id: 4, name: "Fri", y: 8),
    BarData(color: Color.fromRGBO(139, 196, 186, 1), id: 5, name: "Sat", y: 10),
    BarData(color: Color.fromRGBO(120, 237, 237, 1), id: 6, name: "Sun", y: 11),
  ];

  List<BarData> get getChartData {
    return [...barData];
  }

}
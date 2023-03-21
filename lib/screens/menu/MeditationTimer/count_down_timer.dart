import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:provider/provider.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
class CountDownTimerComponent extends StatefulWidget {
  DateTime datetime;
  CountDownTimerComponent(this.datetime);
  @override
  State<CountDownTimerComponent> createState() =>
      _CountDownTimerComponentState();
}

class _CountDownTimerComponentState extends State<CountDownTimerComponent> {
  int get getTime{
    return widget.datetime.hour*60*60+widget.datetime.minute*60+widget.datetime.second;
  } 
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CountDownProvider>(context).controller;
    return Center(
      child: NeonCircularTimer(
          onComplete: () {
            Navigator.of(context).pop();
          },
          textFormat: TextFormat.HH_MM_SS,
          width: 250,
          isReverse: true,
          textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 37),
          controller: controller,
          duration: getTime,
          strokeWidth: 6,
          isTimerTextShown: true,
          neumorphicEffect: true,
          outerStrokeColor: Colors.grey,
          innerFillGradient: LinearGradient(colors: [
            Colors.greenAccent.shade200,
            Colors.blueAccent.shade400
          ]),
          neonGradient: LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(143, 227, 221, 1)
          ]),
          strokeCap: StrokeCap.round,
          innerFillColor: Colors.black12,
          backgroudColor: Theme.of(context).primaryColor,
          neonColor: Colors.blue.shade900),
    );
  }
}

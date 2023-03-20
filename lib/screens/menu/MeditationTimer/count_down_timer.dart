import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';

void onEnd() {
  print('onEnd');
}

class CountDownTimerComponent extends StatefulWidget {

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * /*seconds*/10;
  late CountdownTimerController controller;

  @override
  State<CountDownTimerComponent> createState() =>
      _CountDownTimerComponentState();
}

class _CountDownTimerComponentState extends State<CountDownTimerComponent> {
  @override
  Widget build(BuildContext context) {
  widget.controller=  
      CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * /*seconds*/10, onEnd: onEnd);
    return Center(
      child: CountdownTimer(
        widgetBuilder: (context, time) {
          //time {days,hours,min,milliseconds,sec}
          return Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(143, 227, 221, 1)]),
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(200),
            ),
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Text(
                  time== null?"hi": "${time!.hours}:${time!.min}:${time!.sec}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          );
        },
        controller:widget.controller,
        endTime: widget.endTime,
        onEnd: onEnd,
      ),
    );
  }
}

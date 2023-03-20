import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

void onEnd() {
  print('onEnd');
}

class CountDownTimerComponent extends StatefulWidget {

  DateTime endTime;
  late CountdownTimerController controller;
  //DateTime.now().millisecondsSinceEpoch + 1000 * /*seconds*/10;
  CountDownTimerComponent(this.endTime);
  int get getTime{
    return DateTime.now().microsecondsSinceEpoch + endTime.day*24*60*60+endTime.minute*60+endTime.second;
  }
  @override
  State<CountDownTimerComponent> createState() =>
      _CountDownTimerComponentState();
}

class _CountDownTimerComponentState extends State<CountDownTimerComponent> {
  @override
  Widget build(BuildContext context) {
  widget.controller=  
      CountdownTimerController(endTime: widget.getTime, onEnd: onEnd);
      print(widget.endTime);
      print(widget.getTime);
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
                  time== null?"hi": "${time!.hours==null?0:time.hours}:${time!.min==null?0:time.min}:${time!.sec==null?0:time.sec}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          );
        },
        controller:widget.controller,
        endTime: widget.getTime,
        onEnd: onEnd,
      ),
    );
  }
}

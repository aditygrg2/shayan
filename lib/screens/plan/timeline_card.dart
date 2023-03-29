import 'package:flutter/material.dart';


class TimelineCard extends StatelessWidget {
  bool isActive;
  String time;
  String task;
  String duration;
  TimelineCard({this.isActive=false,required this.task,required this.time,required this.duration});

  String processDuration(String str){
    var arr=str.split(':');
    String ans="";
    ans+= arr[0]+":";
    ans+=arr[1];
    return ans;
  }
  @override
  Widget build(BuildContext context) {
    duration = processDuration(duration);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: isActive? Color.fromRGBO(143, 227, 221, 1): Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(child: isActive? Icon(Icons.star,color: Colors.yellow[400],):Icon(Icons.timer_outlined,color: Colors.black,),),
              Container(child: Text(isActive? "Now" :duration),),
            ],
          ),
          Container(width: double.infinity,height: 1,child: Text(""),decoration: BoxDecoration(border: Border.all(color: Colors.black)),),
          Container(padding: EdgeInsets.all(10),child: Text(time),),
          Container(padding: EdgeInsets.all(10),child: Text(task),)
        ],
      ),
    );
  }
}
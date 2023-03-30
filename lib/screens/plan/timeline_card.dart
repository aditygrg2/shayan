import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/plan/addEdit_timeline.dart';

class TimelineCard extends StatelessWidget {
  bool isActive;
  String time;
  String task;
  String duration;
  int index;
  Map<String,String>?suggestion;
  TimelineCard({
    required this.index,
    this.isActive = false,
    required this.task,
    required this.time,
    required this.duration,
    this.suggestion
  });

  String processDuration(String str) {
    var arr = str.split(':');
    String ans = "";
    ans += arr[0] + " : ";
    ans += arr[1];
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    duration = processDuration(duration);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: isActive ? Color.fromRGBO(143, 227, 221, 1) : Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: isActive
                    ? Icon(
                        Icons.star,
                        color: Colors.yellow[400],
                      )
                    : Icon(
                        Icons.timer_outlined,
                        color: Colors.black,
                      ),
              ),
              SizedBox(width: 15,),
              Container(
                child: Text(isActive ? "Now" : "Upcoming"),
              ),
           if(suggestion!=null)   Expanded(child: Container(child: IconButton(icon:Icon(Icons.arrow_forward,color: Colors.black),onPressed:(){
            Navigator.of(context).pushNamed(suggestion!['route'].toString());
           } ,),alignment: Alignment.centerRight,))
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            height: 1,
            child: Text(""),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Text(time,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(task,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: AddEditTimeline(index));
                        },
                        backgroundColor: Colors.white);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

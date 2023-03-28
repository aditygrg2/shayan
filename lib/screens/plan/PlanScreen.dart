import 'package:flutter/material.dart';
import '../../widgets/UI/home_screen_heading.dart';
import 'package:provider/provider.dart';
import '../../providers/watch_provider.dart';
import 'package:timelines/timelines.dart';

class PlanScreen extends StatefulWidget {
  static const routeName = '/plan';

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<Map<dynamic, dynamic>> timeline = [
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
    {
      "time":"08:00 am",
      "description":"I will wake up at 8 am"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          HomeScreenText(
            text: "My Plan",
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height ,
            child: Timeline.tileBuilder(
              physics: NeverScrollableScrollPhysics(),
              theme: TimelineThemeData(color: Color.fromRGBO(143, 227, 221, 1)),
              builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.alternating,
                  contentsBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(padding: EdgeInsets.all(10),width: 100,height: 100,child: Text(timeline[index]['description']),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10))),
                    );
                  },
                  oppositeContentsBuilder: (context, index) {
                    return Container(padding: EdgeInsets.all(10),child: Text(timeline[index]['time'],style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Color.fromRGBO(250, 195, 68, 1),borderRadius: BorderRadius.lerp(BorderRadius.circular(5), BorderRadius.circular(8), 8)),);
                  },
                  itemCount: timeline.length),
            ),
          ),
        ],
      ),
    );
  }
}

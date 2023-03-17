import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';

class MySleepReport extends StatefulWidget {
  bool getReport = true;
  List<Map<String, String>> reports = [
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy'
    },
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy'
    },
    {
      'title': 'Efficiency',
      'score': '97%',
      'description':
          'Your sleep efficiency is the ratio of actual sleeping time to total time in bed. You want it to be above 85% to be healthy'
    },
  ];
  @override
  State<MySleepReport> createState() => _MySleepReportState();
}

class _MySleepReportState extends State<MySleepReport> {
  void getReport() {
    setState(() {
      widget.getReport = !widget.getReport;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: widget.getReport
          ? Column(
              children: [
                HomeScreenText('Sleep Report'),
                Container(
                  height: 250,
                  child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/f599/e051/346e193f4cdc20b86a34b91db9ad5550?Expires=1679875200&Signature=SkIrpsSAKiNyhHGFbgp5CJIT5WmZ4rPBwzanvM48FC~HWnDdC7TEfATTl7P1BXBtLiA~aA~jgULv543aiXA7dUXpOzkIawHYvv~9GEExVo6hF-v0brKgdQmXn8GJYp~0uyYpAfaExQ-5DFb2ADGZQvQGSuMU8wAUlre6C9rZOTYwNCrOWLN8yNTHfda-~O035m3EQQiT~oihUfy8b7aZoEGkJNQ0t0twUJjDRY0faXagi6tJdTKChm2up2Z-0GjSQ1L1JzVjk-KNFCiz05uyCfNdhMHFBIgmnC1PlWfxQW6kVd0mp2MA1deZm1gWFpxHTejed4XF1a5D1jcDTnAN1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                ),
                Container(
                  child: Text(
                    "Let's optimize your sleep experience",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.68,
                  height: 100,
                  child: Flexible(
                      child: Text(
                    "Give us insights into your sleep, lifestyle and daily behaviors and we'll create a personalized plan that suits your needs.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: getReport,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 195, 68, 1),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, offset: Offset(5, 5))
                        ]),
                    child: Text("get Report"),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Sleep Report',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          padding: EdgeInsets.all(8),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: 140,
                          padding: EdgeInsets.all(8),
                          child: Flexible(
                              child: Text(
                            "Give us insights into your sleep, lifestyle and daily behaviors and we'll create a personalized plan that suits your needs.",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                        )
                      ],
                    ),
                    Container(
                      width: 70,
                      height: 200,
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/a903/aa89/b6842b14f43e619237889e9ad5dfd390?Expires=1679875200&Signature=LySlo8I3DXQIVKJp66lMICQqy-J88d9AoaWKQYkKH9xC1D5AP~l2cplygt5A4IB80HjSPXUP7Yehy5~OMR5d1TYBIEm4~cjF5~o93AYykQwBdFAkjuD4O8G~g1xaN5gtToWNN-jNBbp2mpsPAd6G6j1rfHU-V-UA3-mDXBAv9aeCN2fXP1kOAe3WNDxh9ubWr4~Cm4DLONNBzqDn8ry95~DCw2ryUCI0MFx4v39sS8ic-UfIWxDliUAF4IR1yDZ-w1JdGWgD4OWtPCUZCnSWsJEIjFj8qHSGWrlxX6J4kP62ljYJCYVvOocyrLEBXTkEy1Ijz0PthGmVpgp6XlALGw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 210,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.reports.map((element) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: PropertyCard(
                            width: 180,
                            height: 160,
                            description: element['description'].toString(),
                            title: element['title'].toString(),
                            score: element['score'].toString(),
                          ));
                    }).toList(),
                  ),
                ),
                Container(
                  child: Text(
                    "Get your sleep report updated after every month",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
    );
  }
}

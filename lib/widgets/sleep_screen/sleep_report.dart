import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/widgets/UI/sliding/home_screen_heading.dart';

class MySleepReport extends StatefulWidget {
  const MySleepReport({super.key});

  @override
  State<MySleepReport> createState() => _MySleepReportState();
}

class _MySleepReportState extends State<MySleepReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            onTap: null,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Color.fromRGBO(250, 195, 68 , 1),boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(5, 5))]),
              child: Text("get Report"),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        children: [
          Container(child: Text('Sleep Report'),),
          Container(child: Image.network("https://s3-alpha-sig.figma.com/img/f599/e051/346e193f4cdc20b86a34b91db9ad5550?Expires=1679875200&Signature=SkIrpsSAKiNyhHGFbgp5CJIT5WmZ4rPBwzanvM48FC~HWnDdC7TEfATTl7P1BXBtLiA~aA~jgULv543aiXA7dUXpOzkIawHYvv~9GEExVo6hF-v0brKgdQmXn8GJYp~0uyYpAfaExQ-5DFb2ADGZQvQGSuMU8wAUlre6C9rZOTYwNCrOWLN8yNTHfda-~O035m3EQQiT~oihUfy8b7aZoEGkJNQ0t0twUJjDRY0faXagi6tJdTKChm2up2Z-0GjSQ1L1JzVjk-KNFCiz05uyCfNdhMHFBIgmnC1PlWfxQW6kVd0mp2MA1deZm1gWFpxHTejed4XF1a5D1jcDTnAN1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),)
        ],
      ),
    );
  }
}
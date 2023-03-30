import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:provider/provider.dart';

class WatchStatus extends StatefulWidget {
  DateTime? time;
  Function? valueSelector;
  bool? status;
  WatchStatus({this.time, this.valueSelector, this.status});

  @override
  State<WatchStatus> createState() => _WatchStatusState();
}

class _WatchStatusState extends State<WatchStatus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Provider.of<WatchDataProvider>(context, listen: false)
            .getPermission();
        await Provider.of<WatchDataProvider>(context, listen: false)
            .getData(widget.time);

        bool status = await widget.valueSelector!();

        if (status) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Your form was automatically filled by data provided by Google Fit",
              ),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Cannot find any data for this date/selection.",
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
            color:
                widget.status! ? Colors.green : Theme.of(context).canvasColor),
        height: 50,
        child: Row(
          children: [
            Image.asset(
              'assets/gfit.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.status!
                    ? 'Connected to Google Fit'
                    : 'Connect to Google Fit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/timeline_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';

class AddEditTimeline extends StatefulWidget {
  int index;
  AddEditTimeline(this.index);
  @override
  State<AddEditTimeline> createState() => _AddEditTimelineState();
}

class _AddEditTimelineState extends State<AddEditTimeline> {
  @override
  Widget build(BuildContext context) {
    var timelineProvider = Provider.of<TimelineProvider>(context);
    var timeController = TextEditingController();
    var taskController = TextEditingController();
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Enter Time in (24 Hour format)"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: timeController,
                key: ValueKey('1'),
                onChanged: (value) {
                  
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Enter Task"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: taskController,
                key: ValueKey('2'),
                onChanged: (value) {
                  
                },
              ),
            ),
            Center(
              child: ElevatedButtonWithoutIcon(
                text: widget.index == -1 ? "Add" : "Edit",
                onPressedButton: () {
                  print(timeController.text);
                  print(taskController.text);
                  if (widget.index == -1) {
                    timelineProvider.addTimeline(
                      timeController.text,
                      taskController.text,
                    );
                    Navigator.of(context).pop();
                  } else {
                    timelineProvider.editTimeline(
                      widget.index,
                      timeController.text,
                      taskController.text,
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

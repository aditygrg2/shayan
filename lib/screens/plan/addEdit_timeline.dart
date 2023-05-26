import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/timeline_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class AddEditTimeline extends StatefulWidget {
  int index;

  AddEditTimeline(this.index);
  @override
  State<AddEditTimeline> createState() => _AddEditTimelineState();
}

class _AddEditTimelineState extends State<AddEditTimeline> {
  var timeController = TextEditingController();
  var taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var timelineProvider = Provider.of<TimelineProvider>(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                (widget.index == -1 ? "Add" : "Edit") + " Timeline Task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: const Text("Enter Time in (24 Hour format)"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: TextField(
                controller: timeController,
                autocorrect: true,
                key: const ValueKey('1'),
                onTap: () {
                  Navigator.of(context).push(showPicker(
                      context: context,
                      value: Time(hour: 0, minute: 0),
                      themeData: ThemeData(),
                      onChange: (value) {
                        setState(() {
                          NumberFormat format = NumberFormat("00");
                          timeController.text =
                              "${format.format(value.hour)}:${format.format(value.minute)}";
                        });
                      }));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: const Text("Enter Task Name"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: TextField(
                controller: taskController,
                autocorrect: true,
                key: const ValueKey('2'),
              ),
            ),
            Center(
              child: ElevatedButtonWithoutIcon(
                text: widget.index == -1 ? "Add" : "Edit",
                onPressedButton: () {
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

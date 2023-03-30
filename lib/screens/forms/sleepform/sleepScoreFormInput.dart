import 'dart:math';

import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:night_gschallenge/widgets/UI/time_boxes.dart';
import 'package:provider/provider.dart';

class SleepScoreFormInput extends StatefulWidget {
  String keya;
  String? question;
  InputTypes? type;
  Function? onSubmit;
  Function? value;
  TimeOfDay? initialValue;
  int? initialText;

  SleepScoreFormInput(
      {this.keya = '2',
      this.question,
      this.type,
      this.onSubmit,
      this.value,
      this.initialValue,
      this.initialText
      });

  @override
  State<SleepScoreFormInput> createState() => _SleepScoreFormInputState();
}

class _SleepScoreFormInputState extends State<SleepScoreFormInput> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    num? something = widget.initialValue?.hour ?? -1;
    String? hour = something != -1
        ? something! > 12
            ? (something - 12).toString()
            : widget.initialValue?.hour.toString()
        : '';
    String? minutes =
        something != -1 ? widget.initialValue?.minute.toString() ?? '' : '';
    String? mode = something != -1
        ? something > 12
            ? 'PM'
            : 'AM'
        : '';
    String? valueSelected = '$hour:$minutes $mode';

    Future.delayed(Duration.zero, () async {
      _controller.text = something == -1 ? '' : valueSelected;
      _controller2.text = widget.initialText.toString() == '-1' ? '' : widget.initialText.toString();
      if(widget.type == InputTypes.TimeInput){
        widget.value!(_controller.text, widget.keya);
      }
      else{
        widget.value!(_controller2.text, widget.keya);
      }
    });

    TimeOfDay startDate = TimeOfDay.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          widget.question!,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        if (widget.type == InputTypes.TimeInput)
          TextFormField(
            key: ValueKey(widget.keya),
            onTap: () => showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((pickedDate) {
              num? something = pickedDate?.hour;
              String? hour = something! > 12
                  ? (something - 12).toString()
                  : pickedDate?.hour.toString();
              String? minutes = pickedDate?.minute.toString();
              String? mode = something > 12 ? 'PM' : 'AM';
              setState(() {
                _controller.text = '$hour:$minutes $mode';
              });

              widget.value!('$hour:$minutes $mode', widget.keya);
            }),
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).canvasColor,
                  width: 2,
                ),
              ),
            ),
          ),
        if (widget.type == InputTypes.NumberInput)
          TextFormField(
            key: ValueKey(widget.keya),
            controller: _controller2,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).canvasColor,
                  width: 2,
                ),
              ),
            ),
            onChanged: (newValue) {
              widget.value!(newValue, widget.keya);
            },
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';

class TimeContainer extends StatelessWidget {
  List<Map<String, dynamic>> _data;
  Function onTapClear;

  TimeContainer(this._data, this.onTapClear);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ..._data.map((box) {
        return Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(19)),
              border: Border.all(color: Colors.amber, width: 1)),
          child: Column(
            children: [
              if (box['recommended'])
                Text(
                  'Suggested',
                ),
              if (box['recommended'])
                SizedBox(
                  height: 10,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    box['wakeup'],
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  '${box['hours']} hours of sleep, ${box['cycles']} sleep cycles'),
            ],
          ),
        );
      }).toList(),
      SizedBox(
        height: 30,
      ),
      ElevatedButtonWithoutIcon(
        text: 'Clear',
        onPressedButton: onTapClear,
      ),
      SizedBox(
        height: 30,
      ),
    ]);
  }
}

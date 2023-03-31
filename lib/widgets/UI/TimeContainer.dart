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
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(19)),
              border: Border.all(color: Colors.amber, width: 1)),
          child: Column(
            children: [
              if (box['recommended'])
                const Text(
                  'Suggested',
                ),
              if (box['recommended'])
                const SizedBox(
                  height: 10,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    box['wakeup'],
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  '${box['hours']} hours of sleep, ${box['cycles']} sleep cycles'),
            ],
          ),
        );
      }).toList(),
      const SizedBox(
        height: 30,
      ),
      ElevatedButtonWithoutIcon(
        text: 'Clear',
        onPressedButton: onTapClear,
      ),
      const SizedBox(
        height: 30,
      ),
    ]);
  }
}

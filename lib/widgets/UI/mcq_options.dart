import 'package:flutter/material.dart';

class McqOptions extends StatefulWidget {
  final List<String>? option_list;

  const McqOptions({this.option_list, Key? key}) : super(key: key);

  @override
  State<McqOptions> createState() => _McqOptionsState();
}

class _McqOptionsState extends State<McqOptions> {
  num? valueSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.option_list!.map((e) {
        return ListTile(
          leading: Radio(
            value: widget.option_list?.indexOf(e),
            groupValue: valueSelected,
            onChanged: (value) {
              setState(() {
                valueSelected = value;
              });
            },
          ),
          title: Text(e),
        );
      }).toList(),
    );
  }
}

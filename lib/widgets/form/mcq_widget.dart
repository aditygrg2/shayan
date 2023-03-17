import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/mcq_options.dart';

class McqWidget extends StatelessWidget {
  final String? question;
  final List<String>? options;

  McqWidget({Key? key, this.question, this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(question!,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 15,
            ),
            McqOptions(option_list: options),
          ],
        ),
      ),
    );
  }
}

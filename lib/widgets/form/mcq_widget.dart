import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_buttons_with_icon.dart';

class McqWidget extends StatefulWidget {
  final String? question;
  final List<String>? options;
  Function(String, int)? onPressedNext;
  void Function()? onPressedBack;
  int? currentQuestion;

  McqWidget({Key? key, this.question, this.options, this.onPressedNext,this.onPressedBack, this.currentQuestion}) : super(key: key);

  @override
  State<McqWidget> createState() => _McqWidgetState();
}

class _McqWidgetState extends State<McqWidget> {
  num? valueSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.question!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                ...widget.options!.map((e) {
                  return ListTile(
                    leading: Radio(
                      splashRadius: 10,
                      value: widget.options?.indexOf(e),
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
                const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButtonsWithIcon(
                icon: Icons.navigate_before_rounded,
                onPressed: widget.currentQuestion! <= 0 ? null : widget.onPressedBack,
                title: "Back",
              ),
              ElevatedButtonsWithIcon(
                icon: Icons.navigate_next_rounded,
                onPressed: (){
                  widget.onPressedNext!(valueSelected.toString(), widget.currentQuestion!);
                },
                title: widget.currentQuestion == 33 ? "Submit" :"Next",
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliderInput extends StatefulWidget {
  double value;
  String title;
  Function callback;
  SliderInput({required this.value,required this.title,required this.callback});

  @override
  State<SliderInput> createState() => _SliderInputState();
}

class _SliderInputState extends State<SliderInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: MediaQuery.of(context).size.width - 20 ,alignment: Alignment.centerLeft,padding: EdgeInsets.all(5), child: Text(widget.title,style: Theme.of(context).textTheme.headlineMedium,),),
        Slider(value: widget.value,min: 0,max: 100, onChanged: (newVal){
          setState(() {
            widget.value = newVal;
            widget.callback(newVal);
          });
        }),
      ],
    );
  }
}
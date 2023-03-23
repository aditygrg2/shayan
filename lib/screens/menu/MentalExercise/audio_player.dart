import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AudioPlayerWithSlider extends StatefulWidget {
  bool isPlaying = true;
  @override
  State<AudioPlayerWithSlider> createState() => _AudioPlayerWithSliderState();
}

class _AudioPlayerWithSliderState extends State<AudioPlayerWithSlider> {
  void handlePlay(){
    setState(() {
      widget.isPlaying = !widget.isPlaying;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        LinearProgressIndicator(value: 5,minHeight: 5),
        SizedBox(height: 20,),
        CircleAvatar(
          radius: 20,
          
          backgroundColor: Color.fromRGBO(143, 227, 221, 1),
          child: IconButton(icon:Icon(widget.isPlaying ? Icons.pause:Icons.play_arrow_rounded,color: Colors.black,),onPressed:handlePlay ,),
        )
      ],
    );
  }
}
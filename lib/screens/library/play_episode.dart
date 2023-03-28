import 'package:flutter/material.dart';

class PlayEpisode extends StatefulWidget {
  int index=0;
  String episodeName="Small Talk";
  String description="In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...";
  String time="8 min";
  PlayEpisode({required this.episodeName,required this.description,required this.time,required this.index});
  @override
  State<PlayEpisode> createState() => _PlayEpisodeState();
}

class _PlayEpisodeState extends State<PlayEpisode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: EdgeInsets.all(7),child: Text("Episode ${widget.index}. ${widget.episodeName}",style: Theme.of(context).textTheme.headlineMedium,)),
            IconButton(onPressed: null, icon: Icon(Icons.play_arrow_rounded,color: Colors.black,size: 34),),
          ],
        ),
        Container(padding: EdgeInsets.all(7),child: Text(widget.description),),
        SizedBox(height: 10,),
        Container(padding: EdgeInsets.all(7),child: Text(widget.time,style: Theme.of(context).textTheme.bodySmall,),),
         Container(margin: EdgeInsets.all(8),height: 1,width: double.infinity,child: Text(''),decoration: BoxDecoration(border: Border.all(color:Colors.black)),),
      ],
     
    );
  }
}
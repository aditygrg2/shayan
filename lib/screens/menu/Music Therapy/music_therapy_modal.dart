import 'package:flutter/material.dart';

class MusicTherapyModal extends StatefulWidget {
  Map<dynamic, dynamic> therapy = {};
  bool isPlaying = false;
  MusicTherapyModal(this.therapy);

  @override
  State<MusicTherapyModal> createState() => _MusicTherapyModalState();
}

class _MusicTherapyModalState extends State<MusicTherapyModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.close),onPressed: () => Navigator.of(context).pop(),),),
          Container(
            width: 100,
            height: 150,
            child: Image.asset(
              widget.therapy['image'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.therapy['mood'],
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 20,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    
                    leading: Container(width: 50,height: 50,child: Image.asset('music_therapy_joyful.png',fit: BoxFit.cover,),decoration: BoxDecoration(shape: BoxShape.circle),),
                    title: Text(widget.therapy['tunes'][index]['title'],style: Theme.of(context).textTheme.headlineMedium,),
                    trailing: CircleAvatar(
                      child: IconButton(
                        icon:Icon(widget.isPlaying?Icons.pause: Icons.play_arrow_rounded),
                        onPressed: (){
                          setState(() {
                            widget.isPlaying=!widget.isPlaying;
                          });
                        },

                      ),
                    ),
                  ),
                );
              },
              itemCount: (widget.therapy['tunes'] as List<dynamic>).length,
            ),
          )
        ],
      ),
    );
  }
}

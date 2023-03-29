import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';

class MusicCategory extends StatelessWidget {
  List<Map<dynamic,dynamic>>data;
  String title;
  MusicCategory({required this.data,required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text(title),),
    
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 100,childAspectRatio: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  ...data.map((e) {
                    return Text("data");
                  }).toList(),
                ],
              ),
            ),
  
        ],
      ),
      );
  }
}

// 
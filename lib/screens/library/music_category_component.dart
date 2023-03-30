import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';

class MusicCategory extends StatelessWidget {
  List<Map<dynamic, dynamic>> data;
  String title;
  MusicCategory({required this.data, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:const EdgeInsets.all(10),
            child: Text(title,style: Theme.of(context).textTheme.headlineMedium,),
          ),
           Container(
            height: 200,
            width: MediaQuery.of(context).size.width-20,
             child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ...data.map((e) {
                    return Container(
                      width: 180,
                      height: 200,
                      margin: EdgeInsets.all(10),
                      child: LibraryCard(
                        heading: data[0]['title'],
                        subHeading: data[0]['description'],
                        src: data[0]['image'],
                      ),
                    );
                  }).toList(),
                ],
              ),
           ),
        ],
      
    );
  }
}

// 
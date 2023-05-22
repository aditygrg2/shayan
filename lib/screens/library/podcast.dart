import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_gschallenge/screens/library/library_card.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class Podcast extends StatelessWidget {
  static String routeName = "/podcast";
  // final _musicData = [
  //   {
  //     'heading': 'Get Sleepy',
  //     'subHeading': 'Want to hear a story to get Sleepy? Watch this podcast and see the results.',
  //     'src': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5mWPkiC91XiT777za6METGVKiBW0Ci08-ag&usqp=CAU',
  //   },
  //   {
  //     'heading': 'Sleep With Me',
  //     'subHeading':
  //         'Insomnia? Can\'t fall asleep? Mind racing at night? Worries keeping you awake? ',
  //     'src': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1NUzRM89XZbR_mJEgkUEVkQKBq6-9np3EYw&usqp=CAU',
  //   },
  //   {
  //     'heading': 'Sleep Meditation Podcast',
  //     'subHeading': 'Hear Relaxing Sleep Sounds To improve your sleep.',
  //     'src': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyiBx3o_Y1vkc892MO5dKD1GEgX1NthnhdDcMyXo-5lrLKvjBllzivBTVBQ9EqWCNfiHM&usqp=CAU',
  //   },
  //   {
  //     'heading': 'The Infinite Monkey Cage',
  //     'subHeading': 'Get a deep knowledge about insomnia and sleep sciene.',
  //     'src': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Q3cGPYXZZKe0KaEOxqj3wZDQ8tsMg63QflqXESeh6ImG5MOjvzVT1Dcz0FpMcoPnvFI&usqp=CAU',
  //   },
  //   {
  //     'heading': 'Slow Radio',
  //     'subHeading':
  //         'Want to fall in love with nature along with improved sleep quality? Slow Radio is best for you.',
  //     'src': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaVl0xBmLN9BSQR4St9iTZBQEqQE7BqZCefg&usqp=CAU',
  //   },
  //   {
  //     'heading': 'Tracks to Relax',
  //     'subHeading': 'Watch weekly Guided Meditations for napping and sleeping. This will help you get on track',
  //     'src':
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTbB-ivIDiWieDbs_xCAEm6eXGinvuy6DaWw&usqp=CAU',
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Podcasts",
          ),
          FutureBuilder(builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.7 / 3,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              Map<String,dynamic>? doc =  snapshot.data?.docs[index].data();
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    PodcastScreenPlay.routeName,
                    arguments: doc
                  );
                },
                child: Container(
                  child: LibraryCard(
                    heading: doc!['podcast']['title'],
                    src: doc['podcast']['image'],
                    subHeading: doc['podcast']['description'],
                  ),
                ),
              );
            },
            itemCount: snapshot.data?.docs.length,
          );
          },future: FirebaseFirestore.instance.collection("podcast").get(),)
        ],
      ),
    );
  }
}


// SlidingCardRounded(heading: _musicData[index]['heading'],src: _musicData[index]['src'],subHeading: _musicData[index]['subHeading']);
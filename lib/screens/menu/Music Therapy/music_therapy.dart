import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy_modal.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MusicTherapy extends StatefulWidget {
  static String routeName = '/music-therapy';

  @override
  State<MusicTherapy> createState() => _MusicTherapyState();
}

class _MusicTherapyState extends State<MusicTherapy> {
  List<Map<dynamic, dynamic>> therapies = [
    {
      'mood': 'Tense',
      'color': Color.fromRGBO(219, 74, 72, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_tensed_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Excited',
      'color': Color.fromRGBO(234, 162, 71, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_excited_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Relaxed',
      'color': Color.fromRGBO(108, 187, 226, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_relaxed_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Sad',
      'color': Color.fromRGBO(160, 161, 163, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_sad_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Bored',
      'color': Color.fromRGBO(252, 244, 122, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_bored_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Joyful',
      'color': Color.fromRGBO(233, 167, 157, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_joyful_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Attentive',
      'image': 'assets/music_therapy_joyful.png',
      'color': Color.fromRGBO(129, 193, 108, 1),
      'tunes': [
        {
          'tune': 'assets/music_therapy_joyful_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Worried',
      'color': Color.fromRGBO(187, 137, 196, 1),
      'image': 'assets/music_therapy_worried.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_worried_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Sleepy',
      'color': Color.fromRGBO(77, 78, 159, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_sleepy_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
    {
      'mood': 'Neutral',
      'color': Color.fromRGBO(255, 255, 255, 1),
      'image': 'assets/music_therapy_joyful.png',
      'tunes': [
        {
          'tune': 'assets/music_therapy_neutral_tune.mp3',
          'title': 'River Tune',
          'image': ''
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Music Therapy",
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 150,
                  child: Image.asset(
                    'assets/music_therapy.gif',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "What's your Mood?",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4 / 2,
                        crossAxisSpacing: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return MusicTherapyModal(therapies[index]);
                              },
                              backgroundColor: therapies[index]['color'],
                            );
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: RadialGradient(
                              radius: 0.8,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                therapies[index]['color']
                              ],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          child: Text(
                            therapies[index]['mood'],
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      );
                    },
                    itemCount: therapies.length,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class MusicTherapy extends StatelessWidget {
  static String routeName = '/music-therapy';
  List<Map<dynamic, dynamic>> therapies = [
    {
      'mood': 'TENSE',
      'color': Color.fromRGBO(219, 74, 72, 1),
    },
    {
      'mood': 'EXCITED',
      'color': Color.fromRGBO(234, 162, 71, 1),
    },
    {
      'mood': 'RELAXED',
      'color': Color.fromRGBO(108, 187, 226, 1),
    },
    {
      'mood': 'Sad',
      'color': Color.fromRGBO(160, 161, 163, 1),
    },
    {
      'mood': 'Bored',
      'color': Color.fromRGBO(252, 244, 122, 1),
    },
    {
      'mood': 'JOYFUL',
      'color': Color.fromRGBO(233, 167, 157, 1),
    },
    {
      'mood': 'ATTENTIVE',
      'color': Color.fromRGBO(129, 193, 108, 1),
    },
    {
      'mood': 'WORRIED',
      'color': Color.fromRGBO(187, 137, 196, 1),
    },
    {
      'mood': 'SLEEPY',
      'color': Color.fromRGBO(77, 78, 159, 1),
    },
    {
      'mood': 'NEUTRAL',
      'color': Color.fromRGBO(255, 255, 255, 1),
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
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/ccb7/0445/73a0959fd468190300e646ca6dc725a7?Expires=1680480000&Signature=doRC4fU6qFF88AMTWkPq-0h-T20e9frXhmqQ5xXM6VkEn~oK85YLIYhrHDQ8tnytQ-tmoTZtYddDimofUTg953v7qeeWzBstBNa2hwKyx0NT10tfgNYgOvs56YbUCAQsi1w3hJGxYlM3Bwb6MZGaJ7sPpPBYSMuuLqcUHFSvERcqI9zVDN3zfRKB1P6M1RADi~L2XKDrUBpfBOpzaAqNK07~DCDIvaFKjzxxXNCZ55bEkKsQPdboPmjNFAbUZdzRNNknLzgpdp5O~kJhilCuExAc0rgr2Karp-TXh-U9pyfjWfPQHfks7OMpmqsIVkQeb-OFlO5Huy6yAbP-x3-IFQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "What's your Mood?",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4 / 2,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: RadialGradient(
                            colors: [Color.fromRGBO(255, 255, 255, 1), therapies[index]['color']],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                        child: Text(
                          therapies[index]['mood'],
                          style: Theme.of(context).textTheme.headlineMedium,
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

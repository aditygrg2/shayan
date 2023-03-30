import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/library/play_episode.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class PodcastScreenPlay extends StatelessWidget {
  List<Map<dynamic, dynamic>> episodes = [
    {
      "number":"1",
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "number":"2",
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "number":"3",
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "number":"4",
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "number":"5",
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
  ];
  static String routeName = '/podcast-play';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TopRow(
              back: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Theme.of(context).buttonColor,borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      // width: MediaQuery.of(context).size.width-170,
                      // padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            
                              padding:const EdgeInsets.all(3),
                              child: Expanded(
                                child: Text(
                                  "Calm Yourself Down",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              )),
                          Container(
                             
                              padding:const EdgeInsets.all(3),
                              child: Expanded(
                                child: Text(
                                  "Calm yourself down is a podcast for those who are seeking peace and eslf-compassion",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                           
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("All Episodes"),
            ),
            ...episodes.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: PlayEpisode(
                  time: e['time'],
                  description: e['description'],
                  episodeName: e['title'],
                  index: e['number'],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:night_gschallenge/screens/library/play_episode.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class PodcastScreenPlay extends StatelessWidget {
  List<Map<dynamic, dynamic>> episodes = [
    {
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
      "title": "Small Talk",
      "description":
          "In this episode, or young poet dreams about going back to a time when it was easier to love, laugh and have deep conversations. back when...",
      "time": "8 min"
    },
    {
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
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TopRow(
              back: true,
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/beautiful-view-lake-surrounded-trees-reflected-water-seen-forest-wonderful-sunny-summer-day-157187747.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-170,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        
                          padding: EdgeInsets.all(3),
                          child: Expanded(
                            child: Text(
                              "Calm Yourself Down",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          )),
                      Container(
                         
                          padding: EdgeInsets.all(3),
                          child: Expanded(
                            child: Text(
                              "Calm yourself down is a podcast for those who are seeking peace and eslf-compassion",
                            ),
                          ),
                       
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text("All Episodes"),
            ),
            ...episodes.map((e) {
              return PlayEpisode(
                time: e['time'],
                description: e['description'],
                episodeName: e['title'],
                index: 0,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/library/play_episode.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';

class PodcastScreenPlay extends StatelessWidget {
  static String routeName = '/podcast-play';
  @override
  Widget build(BuildContext context) {
    final podcast =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 80,
                        child: Image.network(
                          podcast['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width-128,
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            podcast['title'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width-128,
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            podcast['description'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text("All Episodes"),
            ),
            ...(podcast['episodes'] as List).map((e) {
              int index = (podcast['episodes'] as List)
                  .indexWhere((element) => element.toString() == e.toString());
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: PlayEpisode(
                  description: e['description'],
                  episodeName: e['title'],
                  index: index,
                  episodes: podcast['episodes'],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

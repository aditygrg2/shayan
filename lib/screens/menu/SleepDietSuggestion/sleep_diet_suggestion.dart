import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:url_launcher/url_launcher.dart';

class SleepDietSuggestion extends StatelessWidget {
  static String routeName = '/sleep-diet-suggestion';
  List<Map<dynamic, dynamic>> suggestions = [
    {
      'tip':
          'Avoid having large meals before sleep. Eat the dinner at least 1 to 1.5 hrs before your bedtime',
      'link': 'https://google.com',
      'position': false,
    },
    {
      'tip':
          'Avoid having large meals before sleep. Eat the dinner at least 1 to 1.5 hrs before your bedtime',
      'link': 'https://google.com',
      'position': true,
    },
    {
      'tip':
          'Avoid having large meals before sleep. Eat the dinner at least 1 to 1.5 hrs before your bedtime',
      'link': 'https://google.com',
      'position': false,
    },
    {
      'tip':
          'Avoid having large meals before sleep. Eat the dinner at least 1 to 1.5 hrs before your bedtime',
      'link': 'https://google.com',
      'position': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
  
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TopRow(
              back: true,
            ),
            HomeScreenText(
              text: "Sleep Diet Suggestion",
            ),
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/sleep_diet_suggestion.gif',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                  children: suggestions.map((e) {
                return Row(
                  mainAxisAlignment: e['position']
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.all(13),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(143, 227, 221, 1),
                          border:
                              Border.all(color: Color.fromRGBO(250, 195, 68, 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(e['tip']),
                    ),
                  ],
                );
              }).toList()),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Related Articles',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Column(
              children: suggestions.map((e) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(e['tip']),
                    ),
                    IconButton(onPressed: ()async{
                        await launchUrl(Uri.parse(e['link']));
                    }, icon: Icon(Icons.insert_link_rounded,color: Colors.black,),),
                    SizedBox(width: 2,)
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

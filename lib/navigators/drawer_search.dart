import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/library/community_screen.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/screens/library/podcast.dart';
import 'package:night_gschallenge/screens/library/stories_screen.dart';
import 'package:night_gschallenge/screens/menu/Maps/google_map.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/phone_free_time.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/SleepinessCalculator/Sleepiness.dart';
import 'package:night_gschallenge/screens/menu/SmartAlarm/smartalarm.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Noisepollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/light_pollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/temperature.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrylist.dart';
import 'package:night_gschallenge/screens/menu/text_to_speech.dart/text_to_speech.dart';
import 'package:night_gschallenge/screens/startup/default_night_screen.dart';
import 'package:night_gschallenge/screens/store/store_screen.dart';
import 'package:night_gschallenge/screens/topbar/chat_screen.dart';
import 'package:night_gschallenge/screens/topbar/profile_screen.dart';
import 'package:night_gschallenge/widgets/home_screen/music_section.dart';

class CustomDelegate extends SearchDelegate<String> {
  List<Map<String, dynamic>> data = [
    {
      "query": ["Sleep Cycle Calculator", "Calculate Cycles"],
      "link": SleepCycleCalculator.routeName,
      "icon": Icons.calculate
    },
    {
      "query": ["My Sleep Form", "Add Last night information"],
      "link": SleepForm.routeName,
      "icon": Icons.calculate
    },
    {
      "query": ["Store", "Buy Sleep Products"],
      "link": StoreScreen.routeName,
      "icon": Icons.shopping_cart
    },
    {
      "query": ["Chatbot", "Chat with a sleep trainer"],
      "link": ChatScreen.routeName,
      "icon": Icons.chat_bubble
    },
    {
      "query": [
        "Profile",
        "User Profile",
        "My Profile",
        "Revoke Google Fit ID",
        "Logout",
        "Verify your email"
      ],
      "link": ProfileScreen.routeName,
      "icon": Icons.person
    },
    {
      "query": ["Change Default Theme", "Theme Change", "Switch Theme"],
      "link": DefaultNightScreen.routeName,
      "icon": Icons.palette
    },
    {
      "query": ["Homepage", "Home", "Main Page"],
      "link": HomeScreen.routeName,
      "icon": Icons.home
    },
    {
      "query": ["Plan Creation Form", "Create Plan", "Plan Form"],
      "link": MainForm.routeName,
      "icon": Icons.edit
    },
    {
      "query": ["Podcasts", "Podcast Episodes", "Listen to Podcasts"],
      "link": Podcast.routeName,
      "icon": Icons.headset
    },
    {
      "query": ["Articles", "Read Articles", "Article Library"],
      "link": ArticlesScreen.routeName,
      "icon": Icons.article
    },
    {
      "query": ["Stories", "Read Stories", "Story Collection"],
      "link": StoryScreen.routeName,
      "icon": Icons.book
    },
    {
      "query": ["Music", "Listen to Music", "Music Player"],
      "link": MusicGalleryScreen.routeName,
      "icon": Icons.music_note
    },
    {
      "query": ["Community", "Join Community", "Community Forum"],
      "link": CommunityScreen.routeName,
      "icon": Icons.group
    },
    {
      "query": ["Test My Bedroom", "Bedroom Assessment", "Bedroom Test"],
      "link": TestMyBedroom.routeName,
      "icon": Icons.bed
    },
    {
      "query": [
        "Light Pollution",
        "Reduce Light Pollution",
        "Light Pollution Tips"
      ],
      "link": LightPollution.routeName,
      "icon": Icons.lightbulb
    },
    {
      "query": [
        "Noise Pollution",
        "Reduce Noise Pollution",
        "Noise Pollution Tips"
      ],
      "link": NoisePollution.routeName,
      "icon": Icons.volume_up
    },
    {
      "query": [
        "Temperature Check",
        "Check Room Temperature",
        "Room Temperature Measurement"
      ],
      "link": Temperature.routeName,
      "icon": Icons.thermostat
    },
    {
      "query": ["Phone Free Time", "Digital Detox", "Unplug Time"],
      "link": PhoneFreeTime.routeName,
      "icon": Icons.phone_disabled_outlined
    },
    {
      "query": ["Meditation Timer", "Mindfulness Timer", "Relaxation Timer"],
      "link": MeditationTimer.routeName,
      "icon": Icons.access_time
    },
    {
      "query": [
        "Listen to Your Stories",
        "Storytelling",
        "Personal Narratives"
      ],
      "link": TextToSpeechComponent.routeName,
      "icon": Icons.record_voice_over
    },
    {
      "query": [
        "Sleep Cycle Calculator",
        "Calculate Sleep Cycle",
        "Optimal Sleep Time"
      ],
      "link": SleepCycleCalculator.routeName,
      "icon": Icons.calculate
    },
    {
      "query": [
        "Sleep Diet Suggestions",
        "Diet Recommendations for Sleep",
        "Healthy Sleep Foods"
      ],
      "link": SleepDietSuggestion.routeName,
      "icon": Icons.food_bank
    },
    {
      "query": ["Mental Exercises", "Brain Training", "Cognitive Workouts"],
      "link": MentalExercise.routeName,
      "icon": Icons.train
    },
    {
      "query": ["Music Therapy", "Therapeutic Music", "Healing Sounds"],
      "link": MusicTherapy.routeName,
      "icon": Icons.spa
    },
    {
      "query": ["Worry List", "Anxiety Tracker", "Worries Management"],
      "link": Worrylist.routeName,
      "icon": Icons.sentiment_very_dissatisfied
    },
    {
      "query": ["Smart Alarm", "Intelligent Alarm", "Advanced Alarm Clock"],
      "link": SmartAlarm.routeName,
      "icon": Icons.alarm
    },
    {
      "query": ["Maps", "Sleep-friendly Locations", "Find Sleep Spots"],
      "link": MapScreen.routeName,
      "icon": Icons.map
    },
    {
      "query": [
        "Daytime Sleepiness Calculator",
        "Check Daytime Sleepiness",
        "Assess Alertness",
        "Epworth Calculator"
      ],
      "link": Sleepiness.routeName,
      "icon": Icons.snooze
    }
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Widget> allSearchQueries = [];
    List<Widget> listToShow = [];

    for (int i = 0; i < data.length; i++) {
      allSearchQueries += data[i]["query"].map<Widget>((dataVal) {
        return ListTile(
          leading: Icon(data[i]["icon"]),
          title: Text(dataVal),
          onTap: () {
            Navigator.of(context).pushNamed(data[i]['link']);
          },
        );
      }).toList();
    }

    allSearchQueries.shuffle();

    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i]["query"].length; j++) {
        if (data[i]["query"][j].toString().toLowerCase().contains(query) ||
            data[i]["query"][j].contains(query)) {
          listToShow.add(ListTile(
            leading: Icon(data[i]["icon"]),
            title: Text(data[i]["query"][j]),
            onTap: () {
              Navigator.of(context).pushNamed(data[i]['link']);
            },
          ));
        }
      }
    }
    return (listToShow.isEmpty && query.isNotEmpty == true)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.not_listed_location_outlined,
                size: 32,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Uh-oh! No sleep-related results found. It's like searching for stars in daylight. Time to try another query or discover other soothing features within our app. Rest assured, we're here to help you catch those elusive Zzz's!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        : ListView(
            children: query.isEmpty ? allSearchQueries : listToShow,
          );
  }
}

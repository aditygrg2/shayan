import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/home_screen/news_update.dart';
import 'package:night_gschallenge/widgets/home_screen/reusable_card.dart';
import 'package:night_gschallenge/widgets/home_screen/sleep_score.dart';
import '../mysleep/my_sleep_screen.dart';
import '../../navigators/drawer.dart';
import '../../navigators/bottomNavigator.dart';
import '../../widgets/home_screen/welcome_user.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final calmData = {'title': 'Calm Tunes', 'tunes': [], 'buttonLink': '/Home'};

  final recents = {
    'title': 'Recents Added',
    'tunes': [],
    'buttonLink': '/Home'
  };

  final newsData = {
    'title': 'News Update',
    'news': ['a', 'b', 'c'],
    'buttonLink': '/Home'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Center(
          child: TextButton(
            child: Text(
              'Homepage',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            onPressed: () {
                // Implement a scroll to top here, on every page! A single function will be fine.
            },
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.chat_rounded),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            WelcomeUser('Name'),
            SleepScore(),
            ReusableCard(calmData),
            NewsUpdate(newsData),
            ReusableCard(recents),
          ],
        ),
      ),
    );
  }
}

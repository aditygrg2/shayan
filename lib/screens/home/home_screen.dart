import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/home_screen/news_update.dart';
import 'package:night_gschallenge/widgets/home_screen/reusable_card.dart';
import '../mysleep/my_sleep_screen.dart';
import '../../navigators/drawer.dart';
import '../../navigators/bottomNavigator.dart';
import '../../widgets/home_screen/welcome_user.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final calmData= {'title':'Calm Tunes','tunes':[],'buttonLink':'/Home'};

  final recents= {'title':'Recents Added','tunes':[],'buttonLink':'/Home'};

  final newsData = {'title':'News Update','news':['a','b','c'],'buttonLink':'/Home'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Container(
        padding: EdgeInsets.all(0),
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            WelcomeUser('Name'),
            ReusableCard(calmData),
            NewsUpdate(newsData),
            ReusableCard(recents),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../mysleep/my_sleep_screen.dart';
import '../../navigators/drawer.dart';
import '../../navigators/bottomNavigator.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

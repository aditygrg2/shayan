import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/widgets/UI/splash_button.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/splash.gif',
          ),
          Center(
            child: Text(
              'App Name',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Bringing light to your night: The ultimate solution for after-hours productivity and entertainment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          SplashButton(
            text: 'Login',
            onPressed: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
          ),
          SplashButton(
            text: 'Signup',
            onPressed: () {
              Navigator.of(context).pushNamed(SignupScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

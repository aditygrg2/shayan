import 'package:flutter/material.dart';
import 'package:night_gschallenge/main.dart';
import 'package:night_gschallenge/screens/home/home_screen.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    ThemeMode _theme = Main.of(context).getTheme();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 200,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      "assets/app-logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: const Text(
                      "Shayan",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Alkatra',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Get the sleep you deserve with Shayan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Alkatra',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            width: 80,
            child: Container(
              child: Image.asset(_theme == ThemeMode.light
                  ? "assets/ellipse_splash_screen_left.png"
                  : "assets/dark_splash_1.png"),
            ),
          ),
          Positioned(
            right: 0,
            width: 140,
            top: 0,
            child: Container(
              child: Image.asset(_theme == ThemeMode.light
                  ? "assets/ellipse_splash_screen_right.png"
                  : "assets/dark_splash_2.png"),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            right: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              child: Container(
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      }),
                  ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Signup",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

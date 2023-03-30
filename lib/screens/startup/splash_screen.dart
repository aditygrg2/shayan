import 'package:flutter/material.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height/2-200,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      "assets/splash_screen.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      "App Name",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-20,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Sleep related app tagline will be placed here only",
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
                child: Image.asset("assets/ellipse_splash_screen.png"),
              )),
          Positioned(
            right: 0,
            width: 140,
            top: 0,
            child: Container(
              child: Image.asset("assets/ellipse_splash_screen_2.png"),
            ),
          ),
          BottomDrawer(
              header: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                width: double.infinity,
                child: Center(
                    child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 2,
                  child: Text(""),
                  decoration: BoxDecoration(color: Colors.grey),
                )),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 80,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButtonWithoutIcon(
                        text: "Login",
                        onPressedButton: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        }),
                    ElevatedButtonWithoutIcon(
                      text: "Sign Up",
                      onPressedButton: () {
                        Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              headerHeight: 28,
              drawerHeight: 150)
        ],
      ),
    );
  }
}


// Image.asset(
//             'assets/splash.gif',
//           ),
//           Center(
//             child: Text(
//               'App Name',
//               style: TextStyle(
//                 fontSize: 40,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Text(
//               'Bringing light to your night: The ultimate solution for after-hours productivity and entertainment.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           SplashButton(
//             text: 'Login',
//             onPressed: () {
//               Navigator.of(context).pushNamed(LoginScreen.routeName);
//             },
//           ),
//           SplashButton(
//             text: 'Signup',
//             onPressed: () {
//               Navigator.of(context).pushNamed(SignupScreen.routeName);
//             },
//           ),
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:night_gschallenge/providers/flutter_ttx.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/text_to_speech.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/providers/location_provider.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Noisepollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/light_pollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/temperature.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
import 'package:night_gschallenge/screens/menu/menu_screen.dart';
import 'package:night_gschallenge/widgets/menu/text_to_speech.dart';
import './screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return WatchData();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return LightProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return FlutterTextSpeech();
          },
        ),

        ChangeNotifierProvider(create: (context){
          return LocationProvider();
        },),
        ChangeNotifierProvider(create: (context){
          return WeatherProvider();
        })

        ChangeNotifierProvider(
          create: (context) {
            return NoiseProvider();;
          },
        ),

      ],
      child: MaterialApp(
        title: 'Night_GSChallenge',
        theme: ThemeData(
          /**Define themes here - Appwide */
          primaryColor: Color.fromRGBO(225, 236, 232, 1),
          backgroundColor: Color.fromRGBO(225, 236, 232, 1),
          scaffoldBackgroundColor: Color.fromRGBO(225, 236, 232, 1),
          canvasColor: Color.fromRGBO(143, 227, 221, 1),
          fontFamily: 'JejuGothic',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(250, 195, 68, 1)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          )),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(250, 195, 68, 1)),
            visualDensity: VisualDensity.comfortable,
          ),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              headlineSmall: TextStyle(
                fontSize: 15,
              ),
              headlineMedium: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold
              ),
              bodyLarge: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              labelLarge: TextStyle(
                fontSize: 25,
              ),
              labelMedium: TextStyle(
                fontSize: 15,
              )),
        ),
        routes: {
          '/': (context) => HomeScreen(),
          LibraryScreen.routeName: (ctx) => LibraryScreen(),
          MySleepScreen.routeName: (ctx) => MySleepScreen(),
          MenuScreen.routeName: (ctx) => MenuScreen(),
          PlanScreen.routeName: (ctx) => PlanScreen(),
          LightPollution.routeName: (ctx) => LightPollution(),
          Temperature.routeName: (ctx) => Temperature(),
          NoisePollution.routeName: (ctx) => NoisePollution(),
          TestMyBedroom.routeName: (ctx) => TestMyBedroom(),
          TextToSpeechComponent.routeName: (ctx) => TextToSpeechComponent(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return HomeScreen();
          });
        },
      ),
    );
  }
}

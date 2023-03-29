// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:night_gschallenge/providers/dialog_flow_provider.dart';
import 'package:night_gschallenge/providers/flutter_ttx.dart';
import 'package:night_gschallenge/providers/form_provider.dart';
import 'package:night_gschallenge/providers/mental_solution_provider.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/providers/screen_brightness_provider.dart';
import 'package:night_gschallenge/providers/speech_to_text_provider.dart';
import 'package:night_gschallenge/providers/timeline_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/providers/location_provider.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/screens/library/podcast.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise_solutions.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/phone_free_time.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/zen_screen.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/Noisepollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/light_pollution.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/temperature.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_one.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_three.dart';
import 'package:night_gschallenge/screens/menu/WorryList/Steps/step_two.dart';
import 'package:night_gschallenge/screens/menu/WorryList/worrylist.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
import 'package:night_gschallenge/screens/menu/menu_screen.dart';
import 'package:night_gschallenge/screens/menu/text_to_speech.dart/text_to_speech.dart';
import 'package:night_gschallenge/screens/topbar/chat_screen.dart';
import 'package:night_gschallenge/screens/topbar/profile_screen.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import './screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) {
                return WatchDataProvider();
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
            ChangeNotifierProvider(
              create: (context) {
                return LocationProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return WeatherProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return NoiseProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return CountDownProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return AudioProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SpeechToText();
              },
            ),
            ChangeNotifierProvider(
              create: (contetx) {
                return MentalSolutionProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return CountDownProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return AudioProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return WorryListProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return DialogflowProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return ScreenBrightnessProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return AuthenticationProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SleepFormProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return TimelineProvider();
              },
            ),
          ],
          child: MaterialApp(
            title: 'Night_GSChallenge',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(225, 236, 232, 1),
              // 	E1ECE8
              backgroundColor: Color.fromRGBO(225, 236, 232, 1),
              scaffoldBackgroundColor: Color.fromRGBO(225, 236, 232, 1),
              canvasColor: Color.fromRGBO(143, 227, 221, 1),
              fontFamily: 'JejuGothic',
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(250, 195, 68, 1)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              radioTheme: RadioThemeData(
                fillColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(250, 195, 68, 1)),
                visualDensity: VisualDensity.comfortable,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                labelLarge: TextStyle(
                  fontSize: 25,
                ),
                labelMedium: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HomeScreen();
                }

                return SplashScreen();
              },
            ),
            routes: {
              LibraryScreen.routeName: (ctx) => LibraryScreen(),
              MySleepScreen.routeName: (ctx) => MySleepScreen(),
              MenuScreen.routeName: (ctx) => MenuScreen(),
              PlanScreen.routeName: (ctx) => PlanScreen(),
              LightPollution.routeName: (ctx) => LightPollution(),
              Temperature.routeName: (ctx) => Temperature(),
              NoisePollution.routeName: (ctx) => NoisePollution(),
              TestMyBedroom.routeName: (ctx) => TestMyBedroom(),
              TextToSpeechComponent.routeName: (ctx) => TextToSpeechComponent(),
              MeditationTimer.routeName: (ctx) => MeditationTimer(),
              MentalExercise.routeName: (ctx) => MentalExercise(),
              MentalExerciseSolution.routeName: (ctx) =>
                  MentalExerciseSolution(),
              SleepCycleCalculator.routeName: (ctx) => SleepCycleCalculator(),
              Worrylist.routeName: (ctx) => Worrylist(),
              StepOne.routeName: (ctx) => StepOne(),
              StepTwo.routeName: (ctx) => StepTwo(),
              StepThree.routeName: (ctx) => StepThree(),
              MusicTherapy.routeName: (ctx) => MusicTherapy(),
              PhoneFreeTime.routeName: (ctx) => PhoneFreeTime(),
              ZenScreen.routeName: (ctx) => ZenScreen(),
              SleepDietSuggestion.routeName: (ctx) => SleepDietSuggestion(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              SignupScreen.routeName: (ctx) => SignupScreen(),
              SplashScreen.routeName: (ctx) => SplashScreen(),
              ProfileScreen.routeName: (ctx) => ProfileScreen(),
              ChatScreen.routeName: (ctx) => ChatScreen(),
              Podcast.routeName: (ctx) => Podcast(),
              PodcastScreenPlay.routeName: (ctx) => PodcastScreenPlay(),
              ArticlesScreen.routeName: (ctx) => ArticlesScreen(),
              MusicGalleryScreen.routeName: (ctx) => MusicGalleryScreen(),
              MainForm.routeName: (ctx) => MainForm(),
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              );
            },
          ),
        );
      },
    );
  }
}

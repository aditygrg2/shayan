import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:night_gschallenge/providers/audio_provider.dart';
import 'package:night_gschallenge/providers/authentication_provider.dart';
import 'package:night_gschallenge/providers/chart_provider.dart';
import 'package:night_gschallenge/providers/community_post.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:night_gschallenge/providers/dialog_flow_provider.dart';
import 'package:night_gschallenge/providers/flutter_ttx.dart';
import 'package:night_gschallenge/providers/mental_solution_provider.dart';
import 'package:night_gschallenge/providers/noise_provider.dart';
import 'package:night_gschallenge/providers/light_provider.dart';
import 'package:night_gschallenge/providers/screen_brightness_provider.dart';
import 'package:night_gschallenge/providers/sleep_disease_provider.dart';
import 'package:night_gschallenge/providers/sleep_report_data_provider.dart';
import 'package:night_gschallenge/providers/sleep_elements_provider.dart';
import 'package:night_gschallenge/providers/smart_alarm_provider.dart';
import 'package:night_gschallenge/providers/store_provider.dart';
import 'package:night_gschallenge/providers/timeline_provider.dart';
import 'package:night_gschallenge/providers/watch_provider.dart';
import 'package:night_gschallenge/providers/location_provider.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/screens/forms/onboardingform/main-form.dart';
import 'package:night_gschallenge/screens/forms/sleepform/sleepForm.dart';
import 'package:night_gschallenge/screens/library/article_viewer.dart';
import 'package:night_gschallenge/screens/library/articles_screen.dart';
import 'package:night_gschallenge/screens/library/community_screen.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/library/music_gallery_screen.dart';
import 'package:night_gschallenge/screens/library/podcast.dart';
import 'package:night_gschallenge/screens/library/podcast_play_screen.dart';
import 'package:night_gschallenge/screens/library/stories_screen.dart';
import 'package:night_gschallenge/screens/menu/Maps/google_map.dart';
import 'package:night_gschallenge/screens/menu/MeditationTimer/meditation_timer.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise.dart';
import 'package:night_gschallenge/screens/menu/MentalExercise/mental_exercise_solutions.dart';
import 'package:night_gschallenge/screens/menu/Music%20Therapy/music_therapy.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/phone_free_time.dart';
import 'package:night_gschallenge/screens/menu/PhoneFreeTime/zen_screen.dart';
import 'package:night_gschallenge/screens/menu/SleepCycleCalculator/sleep_cycle_calculator.dart';
import 'package:night_gschallenge/screens/menu/SleepDietSuggestion/sleep_diet_suggestion.dart';
import 'package:night_gschallenge/screens/menu/SleepinessCalculator/Sleepiness.dart';
import 'package:night_gschallenge/screens/menu/SmartAlarm/smartalarm.dart';
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
import 'package:night_gschallenge/screens/store/store_screen.dart';
import 'package:night_gschallenge/screens/topbar/chat_screen.dart';
import 'package:night_gschallenge/screens/topbar/profile_screen.dart';
import 'package:night_gschallenge/screens/startup/login_screen.dart';
import 'package:night_gschallenge/screens/startup/signup_screen.dart';
import 'package:night_gschallenge/screens/startup/splash_screen.dart';
import 'package:night_gschallenge/widgets/UI/music_player.dart';
import './screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'ThemeClass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();

  static _MainState of(BuildContext context) => 
      context.findAncestorStateOfType<_MainState>()!;
}

class _MainState extends State<Main> {
  ThemeMode _themeMode = ThemeMode.system;
  bool once = true;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode getTheme(){
    if(_themeMode == ThemeMode.system){
      if(Theme.of(context).brightness == Brightness.light){
        _themeMode = ThemeMode.light;
      }
      else if(Theme.of(context).brightness == Brightness.dark){
        _themeMode = ThemeMode.dark;
      }
    }
    return _themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
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
                return TimelineProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return ChartProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return CommunityPostPRovider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SleepDiseaseProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SleepReportDataProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SleepElements();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return SmartAlarmProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                return StoreProvder();
              },
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shayan',
            themeMode: _themeMode,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (!snapshot.hasData) {
                    if(once){
                      once = false;
                      return SplashScreen();
                    }
                    else {
                      return HomeScreen();
                    }
                  } else {
                    return HomeScreen();
                  }
                }
                return Scaffold(
                  body: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
                );
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
              CommunityScreen.routeName: (ctx) => CommunityScreen(),
              SleepForm.routeName: (ctx) => SleepForm(),
              StoryScreen.routeName: (ctx) => StoryScreen(),
              SmartAlarm.routeName: (ctx) => SmartAlarm(),
              MusicPlayer.routeName: (ctx) => MusicPlayer(),
              ArticleViewer.routeName: (ctx) => ArticleViewer(),
              MapScreen.routeName: (ctx) => MapScreen(),
              Sleepiness.routeName: (ctx) => Sleepiness(),
              StoreScreen.routeName: (ctx) => StoreScreen(),
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

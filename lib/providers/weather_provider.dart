import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:provider/provider.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherFactory wf = new WeatherFactory("de7f75459ed602bd2b0575d37018af2e",language: Language.ENGLISH);

  WeatherProvider(){

  
  }

  Future<dynamic> getWeather(double lat, double lon)async{
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    print(w);
    return w;
  }
}
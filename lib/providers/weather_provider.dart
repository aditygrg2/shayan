import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:provider/provider.dart';

class WeatherProvider extends ChangeNotifier {
  bool success = false;
  bool state = false;
  double temperature = -100;

  final List<Map<String, String>> _modalData = [
    {
      "image": "assets/lowtemperature.png",
      "heading": "Agh, it's too cold!",
      "subheading":
          "Looks like the temperature outside is lower than the recommended temperature for sleep. Make sure to adjust AC to a highertemperature, wear warm pjamas or cover yourself with a warm blanket.",
    },
    {
      "image": "assets/goodtemperature.png",
      "heading": "You gotta love the weather!",
      "subheading":
          "Looks like the temperature is perfect for sleep. Try opening a window to get some fresh air flowing and have a sleepy night!",
    },
    {
      "image": "assets/hightemperature.png",
      "heading": "Agh, it's too hot!",
      "subheading":
          "Looks like the temperature outside is higher than the recommended temperature for sleep. Make sure to adjust AC to a lower temperature, wear lightweight,breathable pjamas or cover yourself with a thin blanket.",
    },
    {
      "image": "assets/error.png",
      "heading": "Something unexpected occurred",
      "subheading":
          "We apologize, but we couldn't get the weather data you requested. Maybe try asking the sun directly?"
    }
  ];

  Map<String, String> get dataValue {
    if (temperature == -100) {
      return _modalData[3];
    }
    if (temperature <= 15) {
      return _modalData[0];
    } else if (temperature > 15 && temperature <= 25) {
      return _modalData[1];
    }

    return _modalData[2];
  }

  WeatherFactory wf = WeatherFactory(
    "de7f75459ed602bd2b0575d37018af2e",
    language: Language.ENGLISH,
  );

  Future<dynamic> getWeather(double lat, double lon) async {
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    print(w);
    return w;
  }
}

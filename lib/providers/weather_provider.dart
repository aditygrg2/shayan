import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherProvider extends ChangeNotifier {
  bool success = false;
  bool state = false;
  String temperature = "-100";
  String placename = "";
  String temperatureUnit = "";

  final List<Map<String, String>> _modalData = [
    {
      "image": "https://i.ibb.co/0FKjVR8/lowtemperature.png",
      "heading": "Agh, it's too cold!",
      "subheading":
          "Looks like the temperature outside is lower than the recommended temperature for sleep. Make sure to adjust AC to a highertemperature, wear warm pjamas or cover yourself with a warm blanket.",
      "placename": "",
      "temperature": "",
      "temperatureUnit": "",
    },
    {
      "image": "https://i.ibb.co/dBWPFnp/goodtemperature.png",
      "heading": "You gotta love the weather!",
      "subheading":
          "Looks like the temperature is perfect for sleep. Try opening a window to get some fresh air flowing and have a sleepy night!",
      "placename": "",
      "temperature": "",
      "temperatureUnit": "",
    },
    {
      "image": "https://i.ibb.co/6JJLGws/hightemperature.png",
      "heading": "Agh, it's too hot!",
      "subheading":
          "Looks like the temperature outside is higher than the recommended temperature for sleep. Make sure to adjust AC to a lower temperature, wear lightweight,breathable pjamas or cover yourself with a thin blanket.",
      "placename": "",
      "temperature": "",
      "temperatureUnit": "",
    },
    {
      "image": "https://i.ibb.co/hXz2mNb/error.png",
      "heading": "Something unexpected occurred",
      "subheading":
          "We apologize, but we couldn't get the weather data you requested. Maybe try asking the sun directly?",
      "placename": "",
      "temperature": "",
      "temperatureUnit": "",
    }
  ];

  Map<String, String> get dataValue {
    if (double.parse(temperature) == -100) {
      _modalData[3]["placename"] = placename;
      _modalData[3]["temperature"] = temperature;
      _modalData[3]["temperatureUnit"] = temperatureUnit;
      return _modalData[3];
    }
    if (double.parse(temperature) <= 15) {
      _modalData[0]["placename"] = placename;
      _modalData[0]["temperature"] = temperature;
      _modalData[0]["temperatureUnit"] = temperatureUnit;
      return _modalData[0];
    }
    else if (double.parse(temperature) > 15 &&
        double.parse(temperature) <= 25) {
      _modalData[1]["placename"] = placename;
      _modalData[1]["temperature"] = temperature;
      _modalData[1]["temperatureUnit"] = temperatureUnit;
      return _modalData[1];
    }

    _modalData[2]["placename"] = placename;
    _modalData[2]["temperature"] = temperature;
    _modalData[2]["temperatureUnit"] = temperatureUnit;
    return _modalData[2];
  }

  WeatherFactory wf = WeatherFactory(
    "de7f75459ed602bd2b0575d37018af2e",
    language: Language.ENGLISH,
  );

  Future<dynamic> getWeather(double lat, double lon) async {
    state = true;
    notifyListeners();
    Weather w = await wf.currentWeatherByLocation(lat, lon);

    placename = w.areaName!;
    String temperati = w.temperature!.toString();

    List<String>temperature_data = temperati.split(' ');
    temperatureUnit = temperature_data[1].toString();
    temperature = temperature_data[0].toString();

    state = false;
    success = true;
    notifyListeners();
  }
}

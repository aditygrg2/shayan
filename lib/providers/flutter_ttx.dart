import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class FlutterTextSpeech extends ChangeNotifier {
  FlutterTts flutterTts = FlutterTts();
  String text = "Please enter text";

  FlutterTextSpeech(){
    // flutterTts.setQueueMode(0);
  }
  void setText(String string) {
    text = string;
  }

  void setVolume(double vol){
    flutterTts.setVolume(vol);
  }

  void speak(){
    flutterTts.speak(text);
  }
  
  void setRate(double rate){
    flutterTts.setSpeechRate(rate);
  }

  void setLanguage(String language){
    flutterTts.setLanguage(language);
  }

  void setPitch(double pitch) {
    flutterTts.setPitch(pitch);
  }

  Future<dynamic> getVoices(){
    var response =  flutterTts.getVoices;
    return response;
  }
  Future<dynamic> getLanguages(){
    var response = flutterTts.getLanguages;
    return response;
  }

  Future<dynamic> setVoice(List<dynamic>voiceMap,value){
    var voice = voiceMap.firstWhere((element){
     return element['name']==value;
    });
    return flutterTts.setVoice({'name':voice['name'],'locale':voice['locale']});
  }

  Future<dynamic> pause(){
    return flutterTts.pause();
  }

  Future<dynamic> stop(){
    return flutterTts.stop();
  }
}

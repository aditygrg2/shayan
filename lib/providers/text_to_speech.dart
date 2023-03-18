import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class TextSpeech extends ChangeNotifier {
  TextToSpeech text_to_speech = TextToSpeech();
  String text = "Please enter text";

  void getText(String string) {
    text = string;
  }

  void setVolume(double vol){
    text_to_speech.setVolume(60);
  }

  void speak(){
    text_to_speech.speak(text);
  }
  
  void setRate(double rate){
    text_to_speech.setRate(rate);
  }

  void setLanguage(String language){
    text_to_speech.setLanguage(language);
  }

  void setPitch(double pitch) {
    text_to_speech.setPitch(pitch);
  }
}

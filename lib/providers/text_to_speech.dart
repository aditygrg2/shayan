// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:text_to_speech/text_to_speech.dart';

// class TextSpeech extends ChangeNotifier {
//   TextToSpeech text_to_speech = TextToSpeech();
//   String text = "Please enter text";

//   void setText(String string) {
//     text_to_speech.setLanguage('Microsoft Mark - English (United States)');
//     text = string;
//   }

//   void setVolume(double vol){
//     text_to_speech.setVolume(60);
//   }

//   void speak(){
//     text_to_speech.speak(text);
//   }
  
//   void setRate(double rate){
//     text_to_speech.setRate(rate);
//   }

//   void setLanguage(String language){
//     text_to_speech.setLanguage(language);
//   }

//   void setPitch(double pitch) {
//     text_to_speech.setPitch(pitch);
//   }

//   Future<dynamic> getVoices(){
//     var response =  text_to_speech.getVoice();
//     return response;
//   }
//   Future<dynamic> getLanguages(){
//     var response = text_to_speech.getLanguages();
//     return response;
//   }
// }

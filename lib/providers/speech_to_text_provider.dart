import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class SpeechToText extends ChangeNotifier{

  stt.SpeechToText speech = stt.SpeechToText();
  bool available = false;
  String lastWords = '';
  SpeechToText(){
    speech.initialize();
  }
  void _onSpeechResult(SpeechRecognitionResult result)async{
     lastWords = result.recognizedWords;
     notifyListeners();
  }
  Future<dynamic> getPermission()async{
  available = await speech.initialize();
  return available;
  }
  void _startListening() async {
    await speech.listen(onResult: _onSpeechResult);
    notifyListeners();
  }
  void _stopListening() async {
    await speech.stop();
    notifyListeners();
  }

}
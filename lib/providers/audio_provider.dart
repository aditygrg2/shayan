import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  Duration duration=Duration();
  Duration progress=Duration();
  dynamic play(String uri) async {
    String audioasset = uri;
    ByteData bytes = await rootBundle.load(uri); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    getProgress();

    player.onDurationChanged.listen((event) {
      duration=event;
      notifyListeners();
    });
    await player.playBytes(soundbytes);

    
  }

  dynamic stop() async {
    int result = await player.stop();
    if (result == 1) {
    } else {
      throw new Error();
    }
  }

  dynamic pause() async {
    int result = await player.pause();
    if (result == 1) {
    } else {
      throw new Error();
    }
  }

  dynamic resume() async {
    int result = await player.resume();
    if (result == 1) {
    } else {
      throw new Error();
    }
  }
  Future<int> getDuration()async{
    int result= await player.getDuration();
    return result;
  }
  void getProgress(){
      player.onAudioPositionChanged.forEach((element) { 
      progress =  element;
      notifyListeners();
     });
  }
  dynamic getPosition()async{
    int result = await player.getCurrentPosition();
    return result;
  }
}

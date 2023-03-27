import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();

  dynamic play(String uri) async {
    String audioasset = uri;
    print('fdfds');
    ByteData bytes = await rootBundle.load(uri); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    if (result == 1) {
      //play success
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
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
}

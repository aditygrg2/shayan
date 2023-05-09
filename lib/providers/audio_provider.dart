import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';


class AudioProvider extends ChangeNotifier {
  AudioPlayer player = new AudioPlayer();
  Duration duration = Duration();
  Duration progress = Duration();

  void load(String uri)async{
    final audioSource = LockCachingAudioSource('https://foo.com/bar.mp3')
    player = new AudioPlayer();
    duration = Duration.zero;
    progress = Duration.zero;

    await player.setUrl(uri);

    player.onDurationChanged.listen((updatedDuration) {
      progress = Duration.zero;
      duration = updatedDuration;
      notifyListeners();
    });
  }

  dynamic play(String uri) async {
    String audioasset = uri;
    // ByteData bytes = await rootBundle.load(uri);
    // Uint8List soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    await player.play(uri);

    player.onAudioPositionChanged.listen((updatedPosition) {
      progress = updatedPosition;
      notifyListeners();
    });
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

  void seek(seekTime) async {
    player.seek(seekTime);
    notifyListeners();
  }

  void release()async{
    print("Release");
    await player.release();
    print(await player.getDuration());
  }

  Future<int> getDuration() async {
    int result = await player.getDuration();
    return result;
  }

  dynamic getPosition() async {
    int result = await player.getCurrentPosition();
    return result;
  }
}

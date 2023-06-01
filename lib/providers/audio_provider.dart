import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  Duration duration = const Duration();
  Duration progress = const Duration();
  Duration buffered = const Duration();

  AudioProvider() {
    player.setLoopMode(LoopMode.all).then((value) {});
  }

  Future load(String? uri) async {
    player = AudioPlayer();
    if (uri == null) {
      return Future(() => false);
    }
    try {
      duration = Duration.zero;
      progress = Duration.zero;
      await player.setUrl(uri);
      duration = player.duration!;
      player.positionStream.listen((element) {
        progress = element;
        notifyListeners();
      });
      player.bufferedPositionStream.listen((event) {
        buffered = event;
        notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  void playAsset(String url) {
    player.setAsset(url);
    player.play();
  }

  dynamic play() async {
    await player.play();
  }

  Future stop() async {
    await player.stop();
    notifyListeners();
  }

  dynamic pause() async {
    await player.pause();
  }

  dynamic resume() async {
    await player.play();
  }

  Future release() async {
    await player.stop();
  }

  void seek(seekTime) async {
    player.seek(seekTime);
    notifyListeners();
  }
}

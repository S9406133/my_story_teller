import 'package:flutter/widgets.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';

/* Defines SoundPlayer class*/
class SoundPlayer {
  FlutterSoundPlayer? _audioPlayer;

  bool get isPlaying => _audioPlayer!.isPlaying;
  bool get isPaused => _audioPlayer!.isPaused;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();
    await _audioPlayer!.openAudioSession();
  }

  void dispose(){
    _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
  }

  Future play(String filePath, VoidCallback whenFinished) async{
    await _audioPlayer!.startPlayer(
      fromURI: filePath,
      whenFinished: whenFinished
    );
  }

  Future stop() async{
    await _audioPlayer!.stopPlayer();
  }

  Future pause() async{
    await _audioPlayer!.pausePlayer();
  }

  Future resume() async{
    await _audioPlayer!.resumePlayer();
  }

  Future skipForward(int skip) async{
    _audioPlayer!.skipForward(skip);
  }

  Future skipBack(int skip) async{
    _audioPlayer!.skipBackward(skip);
  }

  Future togglePlaying({required String filePath, required VoidCallback whenFinished}) async{
    if(_audioPlayer!.isStopped){
      await play(filePath, whenFinished);
    } else{
      await stop();
    }
  }

  Future togglePause() async{
    if(_audioPlayer!.isPaused){
      await resume();
    } else{
      await pause();
    }
  }

}
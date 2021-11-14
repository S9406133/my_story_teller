import 'package:flutter/widgets.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:my_story_teller/data/recorder.dart';

// Temp file for audio recording
//const tempAudioPath = 'current_recording.aac';

/* Defines SoundPlayer class*/
class SoundPlayer {
  FlutterSoundPlayer? _audioPlayer;

  bool get isPlaying => _audioPlayer!.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();
    await _audioPlayer!.openAudioSession();
  }

  void dispose(){
    _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
  }

  Future play(VoidCallback whenFinished) async{
    await _audioPlayer!.startPlayer(
      fromURI: tempAudioPath,
      whenFinished: whenFinished
    );
  }

  Future stop() async{
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying({required VoidCallback whenFinished}) async{
    if(_audioPlayer!.isStopped){
      await play(whenFinished);
    } else{
      await stop();
    }
  }

}
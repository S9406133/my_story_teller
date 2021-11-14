import 'dart:async';

import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

// Temp file for audio recording
const tempAudioPath = 'current_recording.aac';

/* Defines SoundRecorder class */
class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isInitialised = false;

  bool get isRecording => _audioRecorder!.isRecording;

  String get tempPath => tempAudioPath;

  Future init() async{
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted){
      throw RecordingPermissionException('Microphone permission not granted');
    }

    await _audioRecorder!.openAudioSession();
    _isInitialised = true;
  }

  void dispose(){
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isInitialised = false;
  }

  Future record() async{
    if (_isInitialised == false) return;
    await _audioRecorder!.startRecorder(toFile: tempAudioPath);
  }

  Future stop() async{
    if (_isInitialised == false) return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      await record();
    } else{
      await stop();
    }
  }

}
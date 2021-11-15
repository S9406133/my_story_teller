import 'dart:async';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

// Temp file for audio recording
const tempAudioPath = 'current_recording.aac';
//Duration duration = Duration();
int duration = 15000;

/* Defines SoundRecorder class */
class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  //StreamSubscription? _recorderSubscription;
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

    // _recorderSubscription = _audioRecorder!.onProgress!.listen((e) {
    //   //setState(() {
    //     duration = e.duration.inMilliseconds;
    // TODO
    //   });
   // });
  }

  void dispose(){
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isInitialised = false;
  }

  Future record() async{
    if (_isInitialised == false) return;
    await _audioRecorder!.startRecorder(toFile: tempAudioPath);
    print('***************** S  DURATION: '+duration.toString());
  }

  Future stop() async{
    if (_isInitialised == false) return;
    await _audioRecorder!.stopRecorder();
    print('***************** P  DURATION: '+duration.toString());
  }

  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      await record();
    } else{
      await stop();
    }
  }

}
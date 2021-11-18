import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:my_story_teller/data/recorder.dart';
import 'package:my_story_teller/data/user.dart';


Future<bool> saveRecording(int duration) async {
  // Gets path of temporary cache files (where initial recording is kept)
  final Directory tempDirectory = await getTemporaryDirectory();
  String tempDirPath = tempDirectory.path;
  // Gets path of AppDocs files (where records will be saved to)
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  // Variable to assign a random number to the filename of saved recordings
  Random random = Random();
  int fileCounter = random.nextInt(1000); // from 0 up to 999 included

  bool exists = File('$tempDirPath/$tempAudioPath').existsSync();

  if (exists == true) {
    String newPath = '$appDocPath/recording$fileCounter.aac';
    // Copies temporary file to AppDocs dir with random file name
    await File(
        '$tempDirPath/$tempAudioPath')
        .copy(newPath);

    addFileToRecordings(File(newPath), newPath, duration);

    fileCounter++;
  }else {
    print('Temporary Recording file not found');
  }

  print(appDocDir.listSync()); print(tempDirectory.listSync());

  return exists;
}

void addFileToRecordings(File file, String location, int duration){
  User user = users[currentUserIndex];
   print('Duration: $duration');

  user.addRecording(
      currentBookIndex,
      Recording(user.currProfile.firstname, location, duration));

}





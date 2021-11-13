import 'package:flutter/material.dart';
import 'package:my_story_teller/data/book.dart';
import 'package:my_story_teller/data/player.dart';
import 'package:my_story_teller/data/recorder.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:my_story_teller/elements/logout_button.dart';

/* Allows user to make recording - Route: '/bookRec' */

class BookRecording extends StatefulWidget {
  const BookRecording({Key? key}) : super(key: key);

  @override
  State<BookRecording> createState() => _BookRecordingState();
}

class _BookRecordingState extends State<BookRecording> {
  final bgColor = Colors.blueGrey;
  final buttonColor = Colors.teal;

  // Instances of recorder and player
  final recorder = SoundRecorder();
  final player = SoundPlayer();

  final Book _currentBook = users[currentUserIndex].savedBooks[currentBookIndex];
  int _numPages = 0;

  // Variables for Record button
  bool _isRecording = false;
  Icon _recordIcon = const Icon(Icons.mic_off_rounded);
  var _recordColor = Colors.blueGrey;
  var _titleColor = Colors.black;
  String _titleText = '';

  // Variables for Replay button
  bool _replayStopped = true;
  Icon _replayIcon = const Icon(Icons.play_arrow_rounded);

  @override
  void initState() {
    _numPages = _currentBook.pages!.length;
    _recordIcon = const Icon(Icons.mic_off_rounded);
    _replayIcon = const Icon(Icons.play_arrow_rounded, size: 25);
    _titleText = _currentBook.title;
    recorder.init();
    player.init();
    super.initState();
  }

  @override
  void dispose() {
    recorder.dispose();
    player.dispose();
    super.dispose();
  }

  // Record Button
  void record() {
    _isRecording = recorder.isRecording;
    if (_isRecording == true) {
      _recordIcon = const Icon(Icons.mic_rounded);
      _recordColor = Colors.red;
      _titleText = 'RECORDING';
      _titleColor = Colors.red;
    } else {
      _recordIcon = const Icon(Icons.mic_off_rounded);
      _recordColor = Colors.blueGrey;
      _titleText = _currentBook.title;
      _titleColor = Colors.black;
    }
  }

  // Review button
  void replay() {
    _replayStopped = player.isPlaying;
    if (_replayStopped == false) {
      //_replayPaused = true;
      _replayIcon = const Icon(Icons.play_arrow_rounded, size: 25);
    } else {
      //_replayPaused = false;
      _replayIcon = const Icon(Icons.stop_rounded, size: 25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor[100],
        /* App Bar */
        appBar: AppBar(
          backgroundColor: bgColor[300],
          title: const Text('Book Recording'),
          titleTextStyle: const TextStyle(
            fontSize: 24,
          ),
          centerTitle: true,
          actions: const <Widget>[
            LogoutButton(),
          ],
        ),

        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[

                Container(      // Book Title Bar
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  height: 38,
                  child: FittedBox(
                    child: Text(_titleText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: _titleColor,
                      ),
                    ),
                  ),
                ),

                Expanded(             // Swiper
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Swiper(
                      itemBuilder: (BuildContext context,int index){
                        return Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                                _currentBook.pages![index],
                                fit: BoxFit.fill
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 20,
                          margin: const EdgeInsets.all(20),
                        );
                      },
                      itemCount: _numPages,
                      pagination: const SwiperPagination(
                        builder: SwiperPagination.fraction,
                        alignment: Alignment.topCenter,
                      ),
                      control: const SwiperControl(),
                      loop: false,
                    ),
                  ),
                ),

                Container(        // Bottom control bar
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      ElevatedButton.icon(           // Replay button
                        onPressed: () async{
                          await recorder.stop();
                          await player.togglePlaying(
                              whenFinished: () => setState(() => replay()) );
                          setState(() {
                            replay();
                            record();});
                        },
                        icon: _replayIcon,
                        label: const Text('Replay',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(buttonColor),
                          minimumSize: MaterialStateProperty.all(const Size(110,35)),
                        ),
                      ),

                      const SizedBox(width: 5),

                      FloatingActionButton.large(   // Record Button
                        onPressed: () async {
                          await recorder.toggleRecording();
                          setState(() => record(),);
                        },
                        backgroundColor: _recordColor,
                        child: _recordIcon,
                      ),

                      const SizedBox(width: 5),

                      ElevatedButton.icon(           // Save Button
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('The current recording will be saved to your user account.',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextButton(                 //TODO save recording
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    },
                                  child: const Text('OK',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.save_alt,
                          size: 25,
                        ),
                        label: const Text('  Save',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(buttonColor),
                          minimumSize: MaterialStateProperty.all(const Size(110,35)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

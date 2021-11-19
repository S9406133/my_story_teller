import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_story_teller/data/player.dart';
import 'package:my_story_teller/data/user.dart';
import 'package:card_swiper/card_swiper.dart';

/* Book view screen - Route '/recView' */

class RecordingView extends StatefulWidget {
  const RecordingView({Key? key}) : super(key: key);

  @override
  State<RecordingView> createState() => _RecordingViewState();
}

class _RecordingViewState extends State<RecordingView> {
  final bgColor = Colors.teal;

  final SavedBook _currentBook = users[currentUserIndex].savedBooks[currentBookIndex];

  final player = SoundPlayer();
  bool _audioIsPlaying = false;
  bool _audioIsPaused = false;

  int _delay = 0;

  // A local list of the recordings for the current book
  List<Recording> _recordingList = [];
  Recording _selectedRecording = Recording('', '', 0);
  int _numPages = 0;
  var _playIcon = const Icon(Icons.play_arrow);

  /* Custom swipe controller and controller methods */
  SwiperController _controller = SwiperController();

  @override
  void initState() {
    _controller = SwiperController();
    _numPages = _currentBook.pages!.length;
    _playIcon = const Icon(Icons.play_arrow_rounded);
    // Creates a list of all recordings for the current book
    for (int i=0; i < _currentBook.recordings.length; i++){
      _recordingList.add(_currentBook.recordings[i]);
    }
    setSelectedRecording(0);
    player.init();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void setSelectedRecording(int index) async{
    _selectedRecording = _recordingList[index];
    _delay = (_selectedRecording.duration/_numPages).round();
    print('DELAY: $_delay');
  }

  // Stop Button
  void stopAuto() {
    _audioIsPlaying = player.isPlaying;
    _audioIsPaused = player.isPaused;
    _controller.move(0);
    _controller.stopAutoplay();
    _playIcon = const Icon(Icons.play_arrow_rounded);
  }

  // Next Button
  void next() {
    _controller.next(animation: true);
  }

  // Previous Button
  void previous() {
    _controller.previous(animation: true);
  }

  // Play/Pause Button
  void playPauseAuto() {
    _audioIsPlaying = player.isPlaying;
    _audioIsPaused = player.isPaused;
    if (_audioIsPaused == true) {
      _controller.stopAutoplay();
      _playIcon = const Icon(Icons.play_arrow_rounded);
    } else {
      _controller.startAutoplay();
      _playIcon = const Icon(Icons.pause_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /* Drawer */
      endDrawer: Drawer(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(16, 16, 165, 0),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text('Available Recordings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(     // Recording list in drawer
              child: ListView.builder(
                  itemCount: _recordingList.length,
                  itemBuilder: (context, index){
                    return Card(
                      color: Colors.white60,
                      child: ListTile(
                        onTap: () async{
                          if (_audioIsPlaying == true
                              || _audioIsPaused == true){
                            await player.stop();
                          }
                          setState(() {
                            stopAuto();
                            setSelectedRecording(index);}
                          );
                          Navigator.pop(context);
                        },
                        title: Text(_recordingList[index].recorder + ' '
                            + _recordingList[index].date,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: const Icon(Icons.account_box, size: 40,),
                        tileColor: Colors.white60,
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),

      /* App Bar */
      appBar: AppBar(
        backgroundColor: bgColor[300],
        leading: IconButton(onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(_currentBook.title),
        titleTextStyle: const TextStyle(
          fontSize: 24,
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Expanded(           // Swiper
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                // Stops play when it gets to the last page
                if (index == _numPages - 1) {
                  _controller.stopAutoplay();
                  // Stops for number of seconds before returning to the start
                  Future.delayed(
                    Duration(milliseconds: (_delay * 2)),
                        () async {
                      setState(() => stopAuto());
                    },
                  );
                }
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
              ),
              controller: _controller,
              autoplayDelay: _delay,
              loop: false,
              autoplayDisableOnInteraction: true, // Doesn't work!!!
            ),
          ),

          Container(        // Bottom control bar
            height: 65,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(),
                bottom: BorderSide(),
              ),
              color: Colors.white,
            ),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(           // Previous button
                  onPressed: () {
                    previous();
                  },
                  icon: const Icon(Icons.skip_previous_rounded),
                  iconSize: 35,
                ),
                const SizedBox(width: 10),

                IconButton(           // Play/Pause button
                  onPressed: () async{
                    if (_audioIsPaused == true || _audioIsPlaying == true) {
                      await player.togglePause();
                    }else if(_audioIsPlaying == false){
                      await player.play(
                          _selectedRecording.fileLocation,
                              () => setState(() {
                            player.stop();
                            _audioIsPlaying = player.isPlaying;}));
                    }
                    setState(() => playPauseAuto());
                  },
                  icon: _playIcon,
                  iconSize: 35,
                ),
                const SizedBox(width: 10),

                IconButton(           // Stop button
                  onPressed: () async{
                    if (_audioIsPlaying == true) await player.stop();
                    setState(() => stopAuto());
                  },
                  icon: const Icon(Icons.stop_rounded),
                  iconSize: 35,
                ),
                const SizedBox(width: 10),

                IconButton(           // Next button
                  onPressed: () {
                    next();
                  },
                  icon: const Icon(Icons.skip_next_rounded),
                  iconSize: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




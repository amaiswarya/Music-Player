import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget //widget class
{
  const Player({Key? key, required this.music, required this.index})
      : super(key: key);
  final List music;
  final int index;
  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> // state class
{
  int idx = 0;
  bool isPlaying = false; //keep track whether the audio is playing
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero; // to check the duration of audio
  Duration position =
      Duration.zero; // to know the current duration(how long it has played)
  @override
  //initState is lifecycle function which is called by default whenever the widget is loaded
  void initState() {
    setState(() {
      idx = widget.index;
    });
    audioPlayer.onPlayerStateChanged.listen((audioState) {
      //whenever the audio is played or paused this event(audioState) happens and listen to that event

      setState //setState is used to change the value of variable in statefull widget
          (() {
        isPlaying = audioState ==
            PlayerState
                .PLAYING; //gives the status of audioplayer(if playing the audioState value will be true)
      });
    });
    //whenever a new song is played or a song is played in between the seekbar duration should change

    audioPlayer.onDurationChanged.listen((audioDuration) {
      setState(() {
        duration = audioDuration;
      });
    });
//if externally seekbar is changed

    audioPlayer.onAudioPositionChanged.listen((audioPosition) {
      setState(() {
        position = audioPosition;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music[idx].title,
            style: const TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      ),
      body: Stack(children: [
        Container(
          color: const Color.fromARGB(255, 15, 15, 15),
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(children: [
                Container(
                    width: 260,
                    height: 260,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.music[idx].image,
                          fit: BoxFit.cover,
                        ))),
                const SizedBox(height: 20),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(), //duration of song
                    value: position.inSeconds.toDouble(), //position of song
                    // if the seekbar is changed the duration is passed to position variable, then the audio is also moved to that position
                    onChanged: (value) async {
                      position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                    }),
                const SizedBox(height: 20),
                Text(widget.music[idx].title,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                const SizedBox(height: 10),
                Text(widget.music[idx].singer,
                    style: const TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.w500,
                        color: Colors.white60)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: (() async {
                        if (isPlaying == true) {
                          await audioPlayer
                              .pause(); //await is used in case where until and unless it start execution, this will not move ahead
                        } else {
                          await audioPlayer.play(widget.music[idx].audio);
                        }
                      }),
                      icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle),
                      iconSize: 70,
                      color: Colors.red,
                    ),
                  ],
                )
              ])),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  AudioPlayer audioPlayer;
  String durasi = "00:00:00";

  _MyAppState(){

    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((duration){
      setState(() {
       durasi = duration.toString(); 
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

  }

  void playSound(String url)async{
    await audioPlayer.seek(Duration(seconds:30));
    await audioPlayer.play(url);
  }

  void pauseSound()async{
    await audioPlayer.pause();
  }

  void stopSound()async{
    await audioPlayer.stop();
  }
 
  void resumeSound()async{
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Playing Music"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

                RaisedButton(
                  child: Text("Play"),
                  onPressed: (){
                    playSound("http://flutter.id/api/buddy.mp3");
                  },
                ),

                RaisedButton(
                  child: Text("Pause"),
                  onPressed: (){
                    pauseSound();
                  },
                ),

                RaisedButton(
                  child: Text("Stop"),
                  onPressed: (){
                    stopSound();
                  },
                ),

                RaisedButton(
                  child: Text("Resume"),
                  onPressed: (){
                    resumeSound();
                  },
                ),

                Text(durasi, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
        ), 
      ),
    );
  }
}
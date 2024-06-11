import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayViewScreen extends StatefulWidget {
  const AudioPlayViewScreen({super.key});

  @override
  State<AudioPlayViewScreen> createState() => _AudioPlayViewScreenState();
}

class _AudioPlayViewScreenState extends State<AudioPlayViewScreen> {
  final audioPlayer=AudioPlayer();
  bool isPlaying=false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();
    
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying=state==PlayerState.playing;
      });
     });
     audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration=newDuration;
      });
      });
    //super.initState();

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position=newPosition;
      });
      
    });
   
  }
   Future setAudio()async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String url='https://drive.google.com/file/d/1cB1wBm4C600xhNmj6TrTdUOPJhrGD0XQ/view?usp=drive_link';
    audioPlayer.setSourceUrl(url);

    }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio"),),
      body: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network('https://media.es.wired.com/photos/650b2a2e72d73ca3bd5ef0cc/16:9/w_2560%2Cc_limit/Business-OpenAI-Dall-E-3-heart.jpg',
          width: double.infinity,
          fit: BoxFit.cover,),
        ),
        const SizedBox(height: 32,),
        const Text("The Flutter Song",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        ),
        const Text('Sarah Abs',style: TextStyle(fontSize: 20),),
        Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
           onChanged:(value)async {
            final position=Duration(seconds: value.toInt());
            await audioPlayer.seek(position);
            await audioPlayer.resume();
             
           },),
           Padding(padding:EdgeInsets.symmetric(horizontal: 16),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${position}"),
              Text("${duration - position}"),

            ],
           ),),
           CircleAvatar(
            radius: 35,
            child: IconButton(
              icon:Icon(isPlaying? Icons.pause:Icons.play_arrow),
              iconSize: 50,
              onPressed: ()async {
                if(isPlaying){
                  await audioPlayer.pause();
                }else{
                  String url='https://drive.google.com/file/d/1cB1wBm4C600xhNmj6TrTdUOPJhrGD0XQ/view?usp=drive_link';
                  await audioPlayer.play(UrlSource(url));
                }
              },
              ),
              
           )

      ],),
    );
  }
}
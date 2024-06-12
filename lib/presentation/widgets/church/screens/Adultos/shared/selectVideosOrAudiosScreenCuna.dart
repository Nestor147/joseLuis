import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SelectVideosOrAudioScreenAdultos extends StatefulWidget {
  // final Multimedia multimedia;
  const SelectVideosOrAudioScreenAdultos({super.key});

  @override
  State<SelectVideosOrAudioScreenAdultos> createState() => _SelectVideosOrAudioScreenAdultosState();
}

class _SelectVideosOrAudioScreenAdultosState extends State<SelectVideosOrAudioScreenAdultos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor:Color.fromARGB(255, 11, 35, 86) ,),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 219, 235, 248), Color.fromARGB(255, 11, 35, 86)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  context.push('/multimediVideoCuna');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 35, 86),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Icon(Icons.video_call,color: Colors.white,size: 55,),
                    Text("Video",style: TextStyle(color: Colors.white,fontSize: 25),)
                
                  ],),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  context.push('/multimediaAudioCuna');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 35, 86),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Icon(Icons.audio_file,color: Colors.white,size: 55,),
                    Text("Audio",style: TextStyle(color: Colors.white,fontSize: 25),)
                  ],),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

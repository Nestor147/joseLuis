import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SelectVideosOrAudioScreenInfante extends StatefulWidget {
  // final Multimedia multimedia;
  const SelectVideosOrAudioScreenInfante({super.key});

  @override
  State<SelectVideosOrAudioScreenInfante> createState() => _SelectVideosOrAudioScreenInfanteState();
}

class _SelectVideosOrAudioScreenInfanteState extends State<SelectVideosOrAudioScreenInfante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor:colorSDATheme,),
      body: Container(
        decoration: BoxDecoration(
        
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  context.push('/multimediVideoInfante');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorSDATheme,
             
                    boxShadow: [
                
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
                  context.push('/multimediaAudioInfante');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorSDATheme,
       
                    boxShadow: [
                    
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

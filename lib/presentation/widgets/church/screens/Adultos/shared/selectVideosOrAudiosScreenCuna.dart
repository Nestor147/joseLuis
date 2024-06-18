import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
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
      appBar: AppBar(title: Text("Multimedia",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor:colorSDATheme ,),
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
                  context.push('/multimediVideoAdultos');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorSDATheme,
                   
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
                  context.push('/multimediaAudioAdultos');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorSDATheme,
                    
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

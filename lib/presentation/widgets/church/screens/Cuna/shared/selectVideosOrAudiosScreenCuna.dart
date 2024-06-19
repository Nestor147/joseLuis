import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SelectVideosOrAudioScreenCuna extends StatefulWidget {
  // final Multimedia multimedia;
  const SelectVideosOrAudioScreenCuna({super.key});

  @override
  State<SelectVideosOrAudioScreenCuna> createState() => _SelectVideosOrAudioScreenCunaState();
}

class _SelectVideosOrAudioScreenCunaState extends State<SelectVideosOrAudioScreenCuna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor:Colors.white ,),
      body: Container(
        decoration: BoxDecoration(
       
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    color: colorSDATheme,
              
                    boxShadow: [
                      BoxShadow(
                     
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
            ],
          ),
        ),
      ),
    );
  }
}

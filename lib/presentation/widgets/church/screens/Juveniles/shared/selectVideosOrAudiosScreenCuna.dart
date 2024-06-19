import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SelectVideosOrAudioScreenJuveniles extends StatefulWidget {
  // final Multimedia multimedia;
  const SelectVideosOrAudioScreenJuveniles({super.key});

  @override
  State<SelectVideosOrAudioScreenJuveniles> createState() => _SelectVideosOrAudioScreenJuvenilesState();
}

class _SelectVideosOrAudioScreenJuvenilesState extends State<SelectVideosOrAudioScreenJuveniles> {
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
                  context.push('/multimediVideoJuveniles');
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
       
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
            
              
            ],
          ),
        ),
      ),
    );
  }
}

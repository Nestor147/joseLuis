import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/pathVideoOrAudio.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultimediaVideosScreenPrimarios extends StatefulWidget {
  const MultimediaVideosScreenPrimarios({super.key});

  @override
  State<MultimediaVideosScreenPrimarios> createState() => _MultimediaVideosScreenPrimariosState();
}

class _MultimediaVideosScreenPrimariosState extends State<MultimediaVideosScreenPrimarios> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Multimedia',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: colorSDATheme,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: multimediaVideos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.audio_file, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(multimediaVideos[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/video', extra: multimediaVideos[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
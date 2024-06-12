import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/pathVideoOrAudio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultimediaVideosScreenAdultos extends StatefulWidget {
  const MultimediaVideosScreenAdultos({super.key});

  @override
  State<MultimediaVideosScreenAdultos> createState() => _MultimediaVideosScreenAdultosState();
}

class _MultimediaVideosScreenAdultosState extends State<MultimediaVideosScreenAdultos> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Multimedia',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Color.fromARGB(255, 11, 35, 86),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: multimediaVideos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: Color.fromARGB(255, 11, 35, 86),
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
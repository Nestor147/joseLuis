import 'package:cuteapp/config/helpers/datasource/juveniles.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultimediaVideosScreenJuveniles extends StatefulWidget {
  const MultimediaVideosScreenJuveniles({super.key});

  @override
  State<MultimediaVideosScreenJuveniles> createState() => _MultimediaVideosScreenJuvenilesState();
}

class _MultimediaVideosScreenJuvenilesState extends State<MultimediaVideosScreenJuveniles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
        title: Text('Multimedia',style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: multimediaVideosJuveniles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.audio_file, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(multimediaVideosJuveniles[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/video', extra: multimediaVideosJuveniles[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
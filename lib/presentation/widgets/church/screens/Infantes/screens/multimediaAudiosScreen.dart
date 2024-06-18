import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/infantes.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultimediaAudiosScreenInfante extends StatefulWidget {
  const MultimediaAudiosScreenInfante({super.key});

  @override
  State<MultimediaAudiosScreenInfante> createState() => _MultimediaAudiosScreenInfanteState();
}

class _MultimediaAudiosScreenInfanteState extends State<MultimediaAudiosScreenInfante> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Audios',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: colorSDATheme,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: multimediaInfantes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.audio_file, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(multimediaInfantes[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/audio', extra: multimediaInfantes[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
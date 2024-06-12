import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultimediaAudiosScreenJuveniles extends StatefulWidget {
  const MultimediaAudiosScreenJuveniles({super.key});

  @override
  State<MultimediaAudiosScreenJuveniles> createState() => _MultimediaAudiosScreenJuvenilesState();
}

class _MultimediaAudiosScreenJuvenilesState extends State<MultimediaAudiosScreenJuveniles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Audios',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Color.fromARGB(255, 11, 35, 86),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: multimediaAudios.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: Color.fromARGB(255, 11, 35, 86),
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.audio_file, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(multimediaAudios[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/audio', extra: multimediaAudios[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
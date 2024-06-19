import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MisioneroScreenCuna extends StatefulWidget {
  const MisioneroScreenCuna({super.key});

  @override
  State<MisioneroScreenCuna> createState() => _MisioneroScreenCunaState();
}

class _MisioneroScreenCunaState extends State<MisioneroScreenCuna> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
        title: Text('Misionero',style: TextStyle(color: Colors.black
        ),),centerTitle: true,backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: misionero.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.dock_outlined, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(misionero[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/pdfviewer', extra: misionero[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
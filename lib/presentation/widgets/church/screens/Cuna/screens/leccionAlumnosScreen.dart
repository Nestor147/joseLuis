

import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LeccionAlumnosScreenCuna extends StatefulWidget {
  @override
  _LeccionAlumnosScreenCunaState createState() => _LeccionAlumnosScreenCunaState();
}

class _LeccionAlumnosScreenCunaState extends State<LeccionAlumnosScreenCuna> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
        title: Text('Lección Alumnos',style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: leccionesAlumnos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.document_scanner_sharp, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(leccionesAlumnos[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/pdfviewer', extra: leccionesAlumnos[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}


import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/menoresIntermediarios.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LeccionAlumnosScreenIntermedio extends StatefulWidget {
  @override
  _LeccionAlumnosScreenIntermedioState createState() => _LeccionAlumnosScreenIntermedioState();
}

class _LeccionAlumnosScreenIntermedioState extends State<LeccionAlumnosScreenIntermedio> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lección Alumnos',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: colorSDATheme,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: menoresLeccionesIntermedios.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.document_scanner_sharp, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(menoresLeccionesIntermedios[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/pdfviewer', extra: menoresLeccionesIntermedios[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
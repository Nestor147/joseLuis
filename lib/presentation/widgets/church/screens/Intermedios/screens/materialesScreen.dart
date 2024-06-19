import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/menoresIntermediarios.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialScreenIntermedio extends StatefulWidget {
  const MaterialScreenIntermedio({super.key});

  @override
  State<MaterialScreenIntermedio> createState() => _MaterialScreenIntermedioState();
}

class _MaterialScreenIntermedioState extends State<MaterialScreenIntermedio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
        title: Text('Materiales',style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: materialIntermedios.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.dock_outlined, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(materialIntermedios[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/pdfviewer', extra: materialIntermedios[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/datasource/primarios.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialScreenPrimarios extends StatefulWidget {
  const MaterialScreenPrimarios({super.key});

  @override
  State<MaterialScreenPrimarios> createState() => _MaterialScreenPrimariosState();
}

class _MaterialScreenPrimariosState extends State<MaterialScreenPrimarios> {
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
          itemCount: materialPrimarios.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                
                tileColor: colorSDATheme,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                
                leading: Icon(Icons.dock_outlined, color:const Color.fromARGB(255, 255, 255, 255)),
                title: Text(materialPrimarios[index].name,style: TextStyle(color: Colors.white),),
                 trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () {
                  context.push('/pdfviewer', extra: materialPrimarios[index]);
                },
                
              ),
            );
          }),
      )
    );
  }
}
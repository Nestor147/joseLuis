import 'dart:io';

import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/infraestructure/datasources/momentosGraciosos/selectImageFiredb_datasource.dart';
import 'package:cuteapp/presentation/provider/momentosGraciosos/imagenes_slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FunnyMoment extends ConsumerStatefulWidget {
  const FunnyMoment({super.key});

  @override
  FunnyMomentState createState() => FunnyMomentState();
}

class FunnyMomentState extends ConsumerState<FunnyMoment> {
  File? image_to_upload;
  @override
  Widget build(BuildContext context) {
    final globalTheme=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: globalTheme.secondary,
      appBar: AppBar(title: Text("una imagen vale más que mil palabras",style: GoogleFonts.bebasNeue(fontSize: 20),)),
      body:Column(
        
        children: [
          image_to_upload != null ? Image.file(image_to_upload!) : Container(
            margin:const  EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            color: colorTheme,
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Esta es mi imagen, sube la tuya"),
              SizedBox(height: 20,),
              Text("😜"),
              Text("/|\\"),
              Text("|"),
              Text("/\\"),

            ],)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ()async{
              final image=await SelectImageFiredbDataSource().getImage();
              // imagnesSliderProvider
              ref.read(imagnesSliderProvider.notifier).setData();
              ref.read(imagnesSliderProvider.notifier).getImages();

              setState(() {
                try{
                image_to_upload=File(image!.path);

                }catch (error){
                  print(error);
                }
              });
            }, child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(children: [
                Icon(Icons.camera_alt_outlined,size:35,),
               Text("Seleccionar Imagen"),
              
              ],),
            )),
            SizedBox(width: 25,),
            ElevatedButton(onPressed: () async{
              if(image_to_upload==null){
                return;
              }
              final uploaded=await SelectImageFiredbDataSource().uploadImage(image_to_upload!);
              if(uploaded){
                ref.read(imagnesSliderProvider.notifier).setData();
              ref.read(imagnesSliderProvider.notifier).getImages();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Imagen subida correctamente")));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Error al subir la imagen")));
              }
          
            }, child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(children: [
                Icon(Icons.cloud_upload_rounded, size:40,),
                 Text("Publicar Imagen"),
            
              ],),
            )
            ),
              ],
            ),
          )
          
        ],
      ) ,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorTheme,
        onPressed: () {
        ;
      },icon: Icon(Icons.info_outline ,color: Colors.white,),label: Text("Que deberías saber antes " ,style: TextStyle(color: Colors.white),),enableFeedback: true,),
    );
  }
}
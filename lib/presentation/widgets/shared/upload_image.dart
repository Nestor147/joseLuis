import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// Future<void> requestPermission() async{
//   var status=await Permission.storage.status;
//   if(!status.isGranted){
//     await Permission.storage.request();
//   }
// }

Future<void> requestPermissions() async {
  var status = await Permission.storage.status;
    if (!status.isGranted) {
      if (await Permission.storage.request().isGranted) {
        print("Permiso de almacenamiento concedido");
      } else {
        print("Permiso de almacenamiento no concedido");
      }
    } else {
      print("Permiso de almacenamiento ya concedido");
    }
}


Future<File?> pickImageUser(BuildContext context)async{
     print("Solicitando permisos...");
    await requestPermissions();
    File? image;
    final picker = ImagePicker();
    print("Abriendo la galería...");
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      print("Imagen seleccionada: ${pickedFile.path}");
      image = File(pickedFile.path);
    } else {
      print("No se seleccionó ninguna imagen");
    }
    return image;
  
}
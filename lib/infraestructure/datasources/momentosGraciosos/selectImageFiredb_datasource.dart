import 'dart:io';

import 'package:cuteapp/domain/datasource/momentosGraciosos/selectImage_datasource.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage =FirebaseStorage.instance;

class SelectImageFiredbDataSource extends SelectImageDataSource{
  @override
  Future<XFile?> getImage() async{
    final ImagePicker picker=ImagePicker();
    final XFile? image=await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Future<bool> uploadImage(File image) async{
    final String nameFile=image.path.split("/").last;
    final Reference ref =storage.ref().child("momentosGraciosos").child(nameFile);
    final UploadTask uploadTask=ref.putFile(image);
    final TaskSnapshot snapshot=await uploadTask.whenComplete(()=>true);
    if(snapshot.state == TaskState.success){
      final Map<String, String> metadata = {
        'description': 'Esta es una descripción de la imagen.',
        'title': 'Este es el título de la imagen.',
        'userId': '1234567890',
      };
      final SettableMetadata settableMetadata = SettableMetadata(customMetadata: metadata);
      ref.updateMetadata(settableMetadata);
      return true;
    }else{
      return false;
    }
  }

}
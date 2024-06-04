

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/datasource/crearImagenes/crearImage_datasource.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class CrearImageDatasourceImple extends CrearImagenDatasource{
  @override
  Future<String> createImage(String descripcion) async{
         final String url = 'https://cuteapp.onrender.com/generar-imagenes/';
  final Map<String, dynamic> body = {
    'text': descripcion, 
  };
  final Dio dio = Dio();
  final Response response = await dio.post(url, data: body);
  if (response.statusCode == 201) {
    final String receta =await response.data["image_url"];
  print("esta respondiendo la Api ${response}");

    
  return  receta;
  } else {
    return 'Error';   
  }
  }

  @override
  Future<bool> AddImage(String descripcion, String fromWho, String pathImageUrl, String userId ) async {
 try{
  var uuid=Uuid().v4();
     DateTime time=new DateTime.now();
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Imagenes');
   Map<String, dynamic> anecdoteMap = {
    'id':uuid,
    'userId':userId,
    'descripcion': descripcion,
    'pathImageUrl': pathImageUrl,
    'fromWho':fromWho,
    'isDon':false,
   };

  await anecdotesRef.doc(uuid).set(anecdoteMap);
    return true;
 }catch (error){
  return false;
 }
  }

  @override
  Future<bool> deleteImage(String uuid) async{
   try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Imagenes');
   anecdotesRef.doc(uuid).delete();
   return true;
    }catch (error){
      print(error);
      return false;
    }
  
  }
  
  @override
  Future<bool> isdone(String uuid, bool isDone) async{
     try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Imagenes');
   anecdotesRef.doc(uuid).update({
    'isDon':isDone,
   });
   return true;
    }catch (error){
      print(error);
    return false;

    }
  }
  

  

}
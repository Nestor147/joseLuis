

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/datasource/crearImagenes/crearImage_datasource.dart';
import 'package:cuteapp/domain/datasource/crearMusicas/crearMusicas_datasource.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class CrearCancionDatasourceImple extends CrearMusicasDatasource{
  @override
  Future<bool> AddMusic(String letra, String fromWho, String titulo, String userId)async {
try{
  var uuid=Uuid().v4();
     DateTime time=new DateTime.now();
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Musicas');
   Map<String, dynamic> anecdoteMap = {
    'id':uuid,
    'userId':userId,
    'letra': letra,
    'titulo': titulo,
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
   Future<String> createMusic(String descripcion) async {
    final String url = 'https://cuteapp.onrender.com/generar-letra-canciones/';
    final Map<String, dynamic> body = {
      'text': descripcion,
    };
    final Dio dio = Dio();
    final Response response = await dio.post(url, data: body);
    final String mensajeError ="No se pudo crear La canción";
    if (response.statusCode == 201) {
      final responseMusic=response.data;
     final  parrafos=[];
      responseMusic.forEach((cancion) {
    final String letra=cancion['cancion'] as String;
    parrafos.add(letra+"\n\n");
  });
     final cancionConvertidoCadena = parrafos.toString();
    final String cancionModificada = cancionConvertidoCadena.replaceAll("[", "").replaceAll("]", "").replaceAll(",", "");
  
  print(cancionModificada);


      return cancionModificada;
    } else {
      return mensajeError;
    }
  }



  @override
  Future<bool> deleteMusic(String uuid) async{
    try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Musicas');
   anecdotesRef.doc(uuid).delete();
   return true;
    }catch (error){
      print(error);
      return false;
    }
  }

  @override
  Future<bool> isdone(String uuid, bool isDone)async {
   try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Musicas');
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
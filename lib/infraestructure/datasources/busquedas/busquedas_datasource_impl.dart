import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/datasource/anecdotasGraciosas/anecdotasGraciosas.dart';
import 'package:cuteapp/domain/datasource/busquedas/busquedas_datasource.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/CustomAnecdote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
final FirebaseFirestore  _firebase =FirebaseFirestore.instance;

class BusquedaDatasourceImpl extends BusquedasDatasource {
  @override
  Future<bool> isdone(String uuid, bool isDon) async {
    try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Busquedas');
   anecdotesRef.doc(uuid).update({
    'isDon':isDon,
   });
   return true;
    }catch (error){
      print(error);
    return false;

    }
  }
    
  @override
  Future<bool> AddBusqueda(String descripcion, String userId)async {
   try{
  var uuid=Uuid().v4();
     DateTime time=new DateTime.now();
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Busquedas');
   Map<String, dynamic> anecdoteMap = {
    'id':uuid,
      'userId':userId,
    'descripcion': descripcion,
    'isDon':false,
    'time':'${time.hour}:${time.minute}'

   };

  await anecdotesRef.doc(uuid).set(anecdoteMap);
    return true;
 }catch (error){
  return false;
 }
  }
  
  @override
  Future<bool> deleteBusqueda(String uuid)async {
   try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Busquedas');
   anecdotesRef.doc(uuid).delete();
   return true;
    }catch (error){
      print(error);
      return false;
    }

  }
}
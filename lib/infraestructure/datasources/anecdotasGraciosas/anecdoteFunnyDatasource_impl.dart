import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/datasource/anecdotasGraciosas/anecdotasGraciosas.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/CustomAnecdote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
final FirebaseFirestore  _firebase =FirebaseFirestore.instance;

class AnecdoteFunnyDatasourceImpl extends AnedotasFunnyDatasource{
  
  @override
  Future<bool> AddAnecdote(String descripcion, String title, int image, String userId ) async {
 try{
  var uuid=Uuid().v4();
     DateTime time=new DateTime.now();
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Anecdotes');
   Map<String, dynamic> anecdoteMap = {
    'id':uuid,
      'userId':userId,
    'descripcion': descripcion,
    'title': title,
    'image':image,
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
  Future<bool> isdone(String uuid, bool isDon) async {
    try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Anecdotes');
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
  Future<bool> updateAnecdota(String uuid, int image, String title, String descripcion)async {
        try{
     DateTime time=new DateTime.now();

     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Anecdotes');
   anecdotesRef.doc(uuid).update({
    'descripcion':descripcion,
    'title':title,
    'image':image,
    'time':'${time.hour}:${time.minute}'


   });
   return true;
    }catch (error){
      print(error);
    return false;

    }
  }
  
  @override
  Future<bool> deleteAnecdota(String id) async{
    try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Anecdotes');
   anecdotesRef.doc(id).delete();
   return true;
    }catch (error){
      print(error);
      return false;
    }
  
  }
//   @override
//   Stream<List<CustomAnecdotaEntities>> getAnecdote() async* {
//   await Firebase.initializeApp();
//   CollectionReference anecdoteRef = FirebaseFirestore.instance.collection("Anecdotes");
//   final StreamController<List<CustomAnecdotaEntities>> anecdotesController = StreamController<List<CustomAnecdotaEntities>>();
//   anecdoteRef.snapshots().listen((snapshot) {
//   final List<CustomAnecdotaEntities> anecdotesList = [];
//     snapshot.docs.forEach((doc) {
//         anecdotesList.add(CustomAnecdotaEntities(
//       ((doc.data() as Map<String, dynamic>)['userId']),
//       ((doc.data() as Map<String, dynamic>)['descripcion']),
//       ((doc.data() as Map<String, dynamic>)['title']),
//       ((doc.data() as Map<String, dynamic>)['time']), 
//       ((doc.data() as Map<String, dynamic>)['image'])));
//     }
//     );
//    anecdotesController.add(anecdotesList);
//    });
//    print("se esta sacando las anecdotas");
//   yield* anecdotesController.stream;
// }

}
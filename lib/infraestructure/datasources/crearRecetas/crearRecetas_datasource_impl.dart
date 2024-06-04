


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/datasource/crearRecetas/crearRecetas_datasource.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class CrearRecetasDatasourceImple extends CrearRecetasDatasource{
  @override
  Future<bool> AddReceta(String descripcion, String fromWho, String ingredientes, String userId) async {
     try{
  var uuid=Uuid().v4();
     DateTime time=new DateTime.now();
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Recetas');
   Map<String, dynamic> anecdoteMap = {
    'id':uuid,
    'userId':userId,
    'descripcion': descripcion,
    'fromWho':fromWho,
    'ingredientes':ingredientes,
    'tipo':"Comida xd",
    'isDon':false,
   };

  await anecdotesRef.doc(uuid).set(anecdoteMap);
    return true;
 }catch (error){
  return false;
 }
  }

  String modificarReceta(data){
    final ingredientes = data;
    final nuevaLista=[];
    for (String ingrediente in ingredientes) {
    nuevaLista.add(ingrediente+"\n");
  }
    final textoConvertidoCadena = nuevaLista.toString();
    final String textoModificado = textoConvertidoCadena.replaceAll("[", "").replaceAll("]", "");
    return textoModificado;
  }

  @override
  Future<String> createReceta(String descripcion) async{
  // Future<Map<String, dynamic>> createReceta() async{
       final String url = 'https://cuteapp.onrender.com/generar-recetas/';
  final Map<String, dynamic> body = {
    'ingredientes': descripcion, 
  };
  final Dio dio = Dio();
  final Response response = await dio.post(url, data: body);
  
  final recetaError="Error No se pudo crear la receta";
  if (response.statusCode == 201) {
    print("Empezo la ejecucion");
    final recetaResponse= response.data;

    // receta[0]= recetaResponse['recetas']["receta-normal"]["Nombre de la receta"]; // Imprime la segunda receta
    // receta[1]= recetaResponse['recetas']["receta-normal"]["Ingredientes"]; // Imprime la segunda receta
    // receta[2]= recetaResponse['recetas']["receta-normal"]["Instrucciones"]; // Imprime la segunda receta
    // receta[3]= recetaResponse['recetas']["receta-saludable"]["Ingredientes"]; // Imprime la tercera receta
    // receta[4]= recetaResponse['recetas']["receta-saludable"]["Instrucciones"]; // Imprime la tercera receta
    // receta[5]= recetaResponse['recetas']["receta-con calorías"]["Ingredientes"]; // Imprime la primera receta
    // receta[6]= recetaResponse['recetas']["receta-con calorías"]["Instrucciones"];
    final nombreReceta=recetaResponse['recetas']["receta-normal"]["Nombre de la receta"]; // Imprime la segunda receta
    final normalIngredientes =recetaResponse['recetas']["receta-normal"]["Ingredientes"];
    final normalInstrucciones= recetaResponse['recetas']["receta-normal"]["Instrucciones"]; // Imprime la segunda receta
    final saludableIngredientes =recetaResponse['recetas']["receta-saludable"]["Ingredientes"]; // Imprime la tercera receta
    final saludableInstrucciones=recetaResponse['recetas']["receta-saludable"]["Instrucciones"]; // Imprime la tercera receta
    final caloriasIngredientes =recetaResponse['recetas']["receta-con calorías"]["Ingredientes"]; // Imprime la primera receta
    final caloriasInstrucciones=recetaResponse['recetas']["receta-con calorías"]["Instrucciones"];
    final norIngredientes= modificarReceta(normalIngredientes);
    final norInstrucciones= modificarReceta(normalInstrucciones);
    final salIngredientes= modificarReceta(saludableIngredientes);
    final salInstrucciones= modificarReceta(saludableInstrucciones);
    final calIngredientes= modificarReceta(caloriasIngredientes);
    final calInstrucciones= modificarReceta(caloriasInstrucciones); 
  
    final receta=[nombreReceta,"\nRECETA SALUDABLE\n",salIngredientes,salInstrucciones,"\nRECETA NORMAL\n",norIngredientes,norInstrucciones,"\nRECETA CON CALORÍAS\n",calIngredientes,calInstrucciones].toString();
    final String recetaFinal = receta.replaceAll("[", "").replaceAll("]", "").replaceAll(",", "");
    print(recetaFinal);

    print("termino la ejecucion");
    print(recetaResponse);

      print(calIngredientes);
    print(calInstrucciones);
  return  recetaFinal;
}
   else {
    return recetaError;   
  }
  }

  @override
  Future<bool> deleteReceta(String uuid) async{
     try{
     await Firebase.initializeApp();
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Recetas');
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
   CollectionReference anecdotesRef = FirebaseFirestore.instance.collection('Recetas');
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
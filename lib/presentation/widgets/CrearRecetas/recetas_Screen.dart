import 'dart:async';
import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearRecetas/crearRecetas_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/crearRecetas/crearRecetas_provider.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/CustomRecetas_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity/connectivity.dart';

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({super.key});

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {


  bool show =true;


  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorTheme.background,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed:(){
            context.push('/createRecetas');
            // AnecdoteFunnyDatasourceImpl().getAnecdote();
          },
          backgroundColor: colorTheme.primary,
          child: Icon(Icons.add,size: 30,),
          ),
      ),
        body: SafeArea(child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if(notification.direction==ScrollDirection.forward){
              setState(() {
                show=true;
              });
            }if(notification.direction==ScrollDirection.reverse){
              setState(() {
                show=false;
              });
            }return true;
          },
          // child: _AnecdotasGraciosas() //  AnecdotasGraciosas()
          child:  RecetasObtenerDataDesdeFireBase() //  AnecdotasGraciosas()   
        )
        )
    );
  }
}




class RecetasObtenerDataDesdeFireBase extends ConsumerStatefulWidget {
  const RecetasObtenerDataDesdeFireBase({super.key});

  @override
  RecetasObtenerDataDesdeFireBaseState createState() =>
      RecetasObtenerDataDesdeFireBaseState();
}

class RecetasObtenerDataDesdeFireBaseState
    extends ConsumerState<RecetasObtenerDataDesdeFireBase> {
  final Stream<QuerySnapshot> _recetasStream =
    FirebaseFirestore.instance.collection('Recetas').snapshots();
  late StreamSubscription<QuerySnapshot> _recetasSubscription;
   final connectivity = Connectivity();
  bool isOnline = false;
  @override
  void initState() {
    super.initState();
    connectivity.onConnectivityChanged.listen((connectivityResult) {
        if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
        print("Hay internet"); 
        ref.read(anecdotasGraciosasProvider.notifier).actualizarData();  
        }else{
          print("No hay internet");
        }
    
    });

    _recetasSubscription = _recetasStream.listen(
      (querySnapshot) async {

        final recetasList = querySnapshot.docs.reversed.toList();
        for (final document in recetasList) {
          final receta = CustomRecetaEntities(

            id: document['id'],
            userId: document['userId'],
            tipo: document['tipo'],
            fromWho: document['fromWho'],
            descripcion: document['descripcion'],
            isDon: document['isDon'],
            ingredientes:document['ingredientes']
           
          );
          ref.read(crearRecetasProvider.notifier).addReceta(
              receta);
        }
      },

    );
  }
  
  @override
  void dispose() {
    super.dispose();
 
    _recetasSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final recetas = ref.watch(crearRecetasProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Recetas"),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          final receta = recetas[index];
          return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
        if(receta.isDon){
        CrearRecetasDatasourceImple().deleteReceta(receta.id);
        ref.read(crearRecetasProvider.notifier).actualizarData();
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              backgroundColor: Color.fromARGB(255, 37, 222, 12),
                content: Text("Eliminado Correctamente  "),
            ),           
          );
         }else{
           ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              backgroundColor: const Color.fromARGB(255, 244, 231, 54),
              content: Text("Para eliminar debes marcar primero el Switch "),
            ),           
          );
        }
      }, 
     
     child: CustomRecetaScreen(receta));
        },
      ),
    );
  }
}
  





  

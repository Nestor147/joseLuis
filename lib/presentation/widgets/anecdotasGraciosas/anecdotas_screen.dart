import 'dart:async';

import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuteapp/domain/entities/AnecdotasGraciosas/anecdotasGraciosas_entities.dart';
import 'package:cuteapp/infraestructure/datasources/anecdotasGraciosas/anecdoteFunnyDatasource_impl.dart';
import 'package:cuteapp/presentation/widgets/anecdotasGraciosas/shared/CustomAnecdote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity/connectivity.dart';

class AnecdotasScreen extends StatefulWidget {
  const AnecdotasScreen({super.key});

  @override
  State<AnecdotasScreen> createState() => _AnecdotasScreenState();
}

class _AnecdotasScreenState extends State<AnecdotasScreen> {


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
            context.push('/crearAnecdota');
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
          child:  AnecdotasObtenerDataDesdeFireBase() //  AnecdotasGraciosas()   
        )
        )
    );
  }
}

class AnecdotasObtenerDataDesdeFireBase extends ConsumerStatefulWidget {
  const AnecdotasObtenerDataDesdeFireBase({super.key});
  @override
  AnecdotasObtenerDataDesdeFireBaseState createState() =>
      AnecdotasObtenerDataDesdeFireBaseState();
}

class AnecdotasObtenerDataDesdeFireBaseState
    extends ConsumerState<AnecdotasObtenerDataDesdeFireBase> {
  final Stream<QuerySnapshot> _anecdotasStream = FirebaseFirestore.instance.collection('Anecdotes').snapshots();
  late StreamSubscription<QuerySnapshot> _anecdotasSubscription;

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

    _anecdotasSubscription = _anecdotasStream.listen(
      (querySnapshot) async {

        final anecdotesList = querySnapshot.docs.reversed.toList();
        for (final document in anecdotesList) {
          final anecdote = CustomAnecdotaEntities(
            id: document['id'],
            userId: document['userId'],
            isDon: document['isDon'],
            descripcion: document['descripcion'],
            title: document['title'],
            time: document['time'],
            image: document['image'],
          );
          ref.read(anecdotasGraciosasProvider.notifier).addAnecdotaGraciosa(
              anecdote);
        }
      },

    );
  }
  
  @override
  void dispose() {
    super.dispose();
 
    _anecdotasSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final anecdotasGraciosas = ref.watch(anecdotasGraciosasProvider);
    print("Las anecdotas son ${anecdotasGraciosas}");

    return Scaffold(
      appBar: AppBar(title: Text("Anécdotas Graciosas "),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: anecdotasGraciosas.length,
        itemBuilder: (context, index) {
          final anecdota = anecdotasGraciosas[index];
          return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
        if(anecdota.isDon){
  AnecdoteFunnyDatasourceImpl().deleteAnecdota(anecdota.id);
        ref.read(anecdotasGraciosasProvider.notifier).actualizarData();
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
                            content: Text("Para eliminar debes marcar primero se Switch "),
                          ),
                          
                        );

          
        }
      
      }, 
     
     child: Anecdota(anecdota));
        },
      ),
    );
  }
}
  

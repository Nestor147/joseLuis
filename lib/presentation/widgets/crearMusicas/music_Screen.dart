import 'dart:async';

import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearCanciones/crearCancion_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/crearCanciones/crearCanciones_provider.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/CustomMusic_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity/connectivity.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {


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
            context.push('/createMusic');
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
          child:  MusicasObtenerDataDesdeFireBase() //  AnecdotasGraciosas()   
        )
        )
    );
  }
}




class MusicasObtenerDataDesdeFireBase extends ConsumerStatefulWidget {
  const MusicasObtenerDataDesdeFireBase({super.key});

  @override
  MusicasObtenerDataDesdeFireBaseState createState() =>
      MusicasObtenerDataDesdeFireBaseState();
}

class MusicasObtenerDataDesdeFireBaseState
    extends ConsumerState<MusicasObtenerDataDesdeFireBase> {
  final Stream<QuerySnapshot> _musicasStream =
      FirebaseFirestore.instance.collection('Musicas').snapshots();
  late StreamSubscription<QuerySnapshot> _musicaSubscription;
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

    _musicaSubscription = _musicasStream.listen(
      (querySnapshot) async {

        final musicasList = querySnapshot.docs.reversed.toList();
        for (final document in musicasList) {
          final musica = CustomMusicEntities(
            titulo: document['titulo'],
            id: document['id'],
            userId: document['userId'],
            isDon: document['isDon'],
            letra: document['letra'],
            fromWho:document['fromWho']
          );
          ref.read(crearCancionesProvider .notifier).addMusic(
              musica);
        }
      },

    );
  }
  
  @override
  void dispose() {
    super.dispose();
 
    _musicaSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final musicas = ref.watch(crearCancionesProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Músicas"),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: musicas.length,
        itemBuilder: (context, index) {
          final  music = musicas[index];
          return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
        if(music.isDon){
        CrearCancionDatasourceImple().deleteMusic(music.id);
        ref.read(crearCancionesProvider.notifier).actualizarData();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              backgroundColor: Color.fromARGB(255, 37, 222, 12),
                content: Text("Eliminado Correctamente "),
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
     
     child: CustomMusicScreen(music));
        },
      ),
    );
  }
}
  



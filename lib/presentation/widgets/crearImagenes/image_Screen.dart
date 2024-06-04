import 'dart:async';

import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/CustomImage_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity/connectivity.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
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
            context.push('/createImage');
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
          child:  ImagenesObtenerDataDesdeFireBase() //  AnecdotasGraciosas()   
        )
        )
    );
  }
}

class ImagenesObtenerDataDesdeFireBase extends ConsumerStatefulWidget {
  const ImagenesObtenerDataDesdeFireBase({super.key});

  @override
  ImagenesObtenerDataDesdeFireBaseState createState() =>
      ImagenesObtenerDataDesdeFireBaseState();
}

class ImagenesObtenerDataDesdeFireBaseState
    extends ConsumerState<ImagenesObtenerDataDesdeFireBase> {
  final Stream<QuerySnapshot> _imageStream =
      FirebaseFirestore.instance.collection('Imagenes').snapshots();
  late StreamSubscription<QuerySnapshot> _imageSubscription;
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

    _imageSubscription = _imageStream.listen(
      (querySnapshot) async {

        final imageList = querySnapshot.docs.reversed.toList();
        for (final document in imageList) {
          final image = CustomCrearImagenEntities(
            id: document['id'],
            userId: document['userId'],
            isDon: document['isDon'],
            descripcion: document['descripcion'],
            pathImageUrl: document['pathImageUrl'],
            fromWho: document['fromWho'],
          );
          // print("estos son los datos ${image.fromWho}");
          ref.read(crearImagenesProvider.notifier).addImage(
              image);
        }
      },

    );
  }
  
  @override
  void dispose() {
    super.dispose();
 
    _imageSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final imagenesLis = ref.watch(crearImagenesProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Imágenes"),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: imagenesLis.length,
        itemBuilder: (context, index) {
          final image = imagenesLis[index];
          return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
       
          if(image.isDon){
  CrearImageDatasourceImple().deleteImage(image.id);
        ref.read(crearImagenesProvider.notifier).actualizarData();
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
     
     child: CustomImageScreen(image));
        },
      ),
    );
  }
}
  



  

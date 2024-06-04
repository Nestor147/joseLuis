import 'dart:async';

import 'package:cuteapp/domain/entities/Busquedas/busquedas_entities.dart';
import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/busquedas/busquedas_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearCanciones/crearCancion_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/busquedas/busquedas_provider.dart';
import 'package:cuteapp/presentation/provider/crearCanciones/crearCanciones_provider.dart';
import 'package:cuteapp/presentation/widgets/busquedas/shared/customBusqueda.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/CustomMusic_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity/connectivity.dart';

class BusquedaScreen extends StatefulWidget {
  const BusquedaScreen({super.key});

  @override
  State<BusquedaScreen> createState() => _BusquedaScreenState();
}

class _BusquedaScreenState extends State<BusquedaScreen> {


  bool show =true;


  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorTheme.background,
      // floatingActionButton: Visibility(
      //   visible: show,
      //   child: FloatingActionButton(
      //     onPressed:(){
      //       context.push('/createMusic');
      //       // AnecdoteFunnyDatasourceImpl().getAnecdote();
      //     },
      //     backgroundColor: colorTheme.primary,
      //     child: Icon(Icons.add,size: 30,),
      //     ),
      // ),
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
          child:  BusquedasObtenerDataDesdeFireBase() //  AnecdotasGraciosas()   
        )
        )
    );
  }
}




class BusquedasObtenerDataDesdeFireBase extends ConsumerStatefulWidget {
  const BusquedasObtenerDataDesdeFireBase({super.key});

  @override
  BusquedasObtenerDataDesdeFireBaseState createState() =>
      BusquedasObtenerDataDesdeFireBaseState();
}

class BusquedasObtenerDataDesdeFireBaseState
    extends ConsumerState<BusquedasObtenerDataDesdeFireBase> {
  final Stream<QuerySnapshot> _busquedasStream =
      FirebaseFirestore.instance.collection('Busquedas').snapshots();
  late StreamSubscription<QuerySnapshot> _busquedasSubscription;
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

    _busquedasSubscription = _busquedasStream.listen(
      (querySnapshot) async {

        final busquedasList = querySnapshot.docs.reversed.toList();
        for (final document in busquedasList) {
          final busqueda = BusquedaEntities(
            time: document['time'],
            descripcion: document['descripcion'],
            id: document['id'],
            userId: document['userId'],
            isDon: document['isDon'],
          );
          ref.read(busquedasProvider.notifier).addBusqueda(
              busqueda);
        }
      },

    );
  }
  
  @override
  void dispose() {
    super.dispose();
 
    _busquedasSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final busquedas = ref.watch(busquedasProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Búsquedas"),),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: busquedas.length,
        itemBuilder: (context, index) {
          final  busqueda = busquedas[index];
          return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
        if(busqueda.isDon){
        BusquedaDatasourceImpl().deleteBusqueda(busqueda.id); 
        ref.read(busquedasProvider.notifier).actualizarData();
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
     
     child: CustomBusquedaScreen(busqueda));
        },
      ),
    );
  }
}
  



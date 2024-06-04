

import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/imagenesGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/crearRecetas/recetasGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/shared/receta_my_message_buble.dart';
import 'package:cuteapp/presentation/widgets/CrearRecetas/shared/receta_responseApi_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/my_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/responseApi_message_buble.dart';
import 'package:cuteapp/presentation/widgets/shared/keyBoard_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateRecetaScreen extends ConsumerStatefulWidget {
  const CreateRecetaScreen({super.key});

  @override
  CreateRecetaScreenState createState() => CreateRecetaScreenState();
}

class CreateRecetaScreenState extends ConsumerState<CreateRecetaScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('CREA UNA RECETA') ,centerTitle: true,) ,
      body: _SeccionRecetas(),

    );
  }
}
class _SeccionRecetas extends ConsumerStatefulWidget {
 

  @override
  _SeccionRecetasState createState() => _SeccionRecetasState();
}



class _SeccionRecetasState extends ConsumerState<_SeccionRecetas> {
  final scrollController=ScrollController();

 void moveScrollController(){
    Future.delayed(Duration(milliseconds: 150));
   scrollController.animateTo(
      scrollController.position.maxScrollExtent,
     duration: Duration(milliseconds: 300),
      curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
   final recetas=ref.watch(recetasGeneradasProvider);
   final estado=ref.watch(stadoDeCreacionProvider);
   final user=ref.watch(usuarioPersistenteProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: scrollController,
              itemCount: recetas.length,
              itemBuilder:(context, index) {
                final CustomRecetaEntities  receta=recetas[index];
              return (receta.fromWho=="resposeApi")? RecetaResponseApiMessageBuble(receta: receta,):RecetaMyMessageBuble(receta: receta,);
            },)),
            KeyBoardCase(
               onChange: (value) async {
                moveScrollController();
                if(estado==true) {
                  return;}
                  else{
                 ref.read(stadoDeCreacionProvider.notifier).setState();
                final response=await ref.read(recetasGeneradasProvider.notifier).createReceta(value);
                moveScrollController();
               if(response=="Success"){
                moveScrollController();
                  ref.read(stadoDeCreacionProvider.notifier).setState();
               }
                  }
              },
              colorInput: (estado)?Colors.red:Color.fromARGB(255, 165, 64, 227),
              text: (estado)?("Se esta creando la receta..."):("Describe lo que quieres crear")
             
            )
          ],
        ),
      ),
    );
  }
}





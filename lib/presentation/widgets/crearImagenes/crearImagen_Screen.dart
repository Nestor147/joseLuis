

import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/shared/MoveScrollControl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/imagenesGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/my_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/responseApi_message_buble.dart';
import 'package:cuteapp/presentation/widgets/shared/keyBoard_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateImageScreen extends ConsumerStatefulWidget {
  const CreateImageScreen({super.key});

  @override
  CreateImageScreenState createState() => CreateImageScreenState();
}

class CreateImageScreenState extends ConsumerState<CreateImageScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('CREA UNA IMAGEN') ,centerTitle: true,) ,
      body: _SeccionImagenes(),

    );
  }
}
class _SeccionImagenes extends ConsumerStatefulWidget {
 

  @override
  _SeccionImagenesState createState() => _SeccionImagenesState();
}



class _SeccionImagenesState extends ConsumerState<_SeccionImagenes> {
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
   final images=ref.watch(imagenesGeneradasProvider);
   final estado=ref.watch(stadoDeCreacionProvider);
   final user=ref.watch(usuarioPersistenteProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: scrollController,
              itemCount: images.length,
              itemBuilder:(context, index) {
                final CustomCrearImagenEntities  image=images[index];
              return (image.fromWho=="resposeApi")?ResponseApiMessageBuble(image:image):MyMessageBuble(image:image);
            },)),
            KeyBoardCase(
               onChange: (value) async {
                moveScrollController();
                if(estado==true) {
                  return;}
                  else{
                 ref.read(stadoDeCreacionProvider.notifier).setState();
                     final response=await ref.read(imagenesGeneradasProvider.notifier).createImagenes(value);
                moveScrollController();
               if(response=="Success"){
                moveScrollController();
                  ref.read(stadoDeCreacionProvider.notifier).setState();
               }
                  }
              },
              colorInput: (estado)?Colors.red:Colors.blue,
              text: (estado)?("Se esta creando la imagen..."):("Describe lo que quieres crear")
             
            )
          ],
        ),
      ),
    );
  }
}
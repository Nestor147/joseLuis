

import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/shared/MoveScrollControl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/crearCanciones/cancionesGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/imagenesGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/crearRecetas/recetasGeneradas_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/my_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearImagenes/shared/responseApi_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/shared/music_my_message_buble.dart';
import 'package:cuteapp/presentation/widgets/crearMusicas/shared/music_responseApi_message_buble.dart';
import 'package:cuteapp/presentation/widgets/shared/keyBoard_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateMusicScreen extends ConsumerStatefulWidget {
  const CreateMusicScreen({super.key});

  @override
  CreateMusicScreenState createState() => CreateMusicScreenState();
}

class CreateMusicScreenState extends ConsumerState<CreateMusicScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('CREA UNA MÚSICA') ,centerTitle: true,) ,
      body: _SeccionMusic(),

    );
  }
}
class _SeccionMusic extends ConsumerStatefulWidget {
 

  @override
  _SeccionMusicState createState() => _SeccionMusicState();
}



class _SeccionMusicState extends ConsumerState<_SeccionMusic> {
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
   final musicas=ref.watch(cancionesGeneradasProvider);
   final estado=ref.watch(stadoDeCreacionProvider);
   final user=ref.watch(usuarioPersistenteProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: scrollController,
              itemCount: musicas.length,
              itemBuilder:(context, index) {
                final CustomMusicEntities  music=musicas[index];
              return (music.fromWho=="resposeApi")?MusicResponseApiMessageBuble(music: music,):MusicMyMessageBuble(music: music,);
            },)),
            KeyBoardCase(
               onChange: (value) async {
                moveScrollController();
                if(estado==true) {
                  return;}
                  else{
                 ref.read(stadoDeCreacionProvider.notifier).setState();
                     final response=await ref.read(cancionesGeneradasProvider.notifier).createCanciones(value);
                moveScrollController();
               if(response=="Success"){
                moveScrollController();
                  ref.read(stadoDeCreacionProvider.notifier).setState();
               }
                  }
              },
              colorInput: (estado)?Colors.red:Color.fromARGB(255, 252, 127, 1),
              text: (estado)?("Se esta creando la música..."):("Describe lo que quieres crear")
             
            )
          ],
        ),
      ),
    );
  }
}








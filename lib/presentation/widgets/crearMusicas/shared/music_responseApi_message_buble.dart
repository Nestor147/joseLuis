import 'package:cuteapp/domain/datasource/crearMusicas/crearMusicas_datasource.dart';
import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/busquedas/busquedas_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearCanciones/crearCancion_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/crearCanciones/crearCanciones_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MusicResponseApiMessageBuble extends ConsumerStatefulWidget {
   CustomMusicEntities music;
   MusicResponseApiMessageBuble({super.key,required this.music});

  @override
  MusicResponseApiMessageBubleState createState() => MusicResponseApiMessageBubleState();
}
class MusicResponseApiMessageBubleState extends ConsumerState<MusicResponseApiMessageBuble> {
  
    @override
  Widget build(BuildContext context) {
    final estado = ref.watch(stadoDeCreacionProvider);
    final user=ref.watch(usuarioPersistenteProvider);
    final color=Theme.of(context).colorScheme;
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.secondary
          ),  
        ),
        SizedBox(height: 10,),
        CustomMusicScreen(music: widget.music.letra),
        
        SizedBox(height: 10,),
        buttonsAddDeleteMusica(context: context, titulo: widget.music.titulo, userId: user.userId, letra: widget.music.letra),
        SizedBox(height: 10,),
      ],
    );
    
  }
}



class CustomMusicScreen extends ConsumerStatefulWidget {
   final String music;
   CustomMusicScreen({required this.music, super.key});

  @override
  CustomMusicScreenState createState() => CustomMusicScreenState();
}

class CustomMusicScreenState extends ConsumerState<CustomMusicScreen> {
  
  @override
  Widget build(BuildContext context) {
  final colortheme=Theme.of(context).colorScheme;

    return  IntrinsicHeight(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Container(
            width: double.infinity, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow:[ BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0,2)
              )]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // image(),
                  const SizedBox(width: 20,),
    
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14,),
                    Text(widget.music,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
                        const SizedBox(height: 14,),

                    const Spacer(),
                    // butones(context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
    
  }
}

// class _MusicResponseApi extends StatelessWidget {
//   final String imageURL;


//   const _MusicResponseApi({super.key, required this.imageURL});

//   @override
//   Widget build(BuildContext context) {
//    final size=MediaQuery.of(context).size;
//     return ClipRRect(borderRadius: BorderRadius.circular(20),
//       child: Image.network(imageURL,
//       width: size.width*0.7,
//       height: 150,
//       fit: BoxFit.cover,
//       loadingBuilder: (context, child, loadingProgress) {
//         if(loadingProgress==null) return child;
//         return Container(
//           child: Text('Generando Imagen...'),
//         );
//       },)
//       );
//   }
// }



class buttonsAddDeleteMusica extends ConsumerWidget {
  final BuildContext context;
  final String titulo;
  final String userId;
  final String letra;
  const buttonsAddDeleteMusica({
    super.key,

    required this.context,
    required this.titulo,
    required this.userId,
    required this.letra,
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final size=MediaQuery.of(context).size;

    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            // primary: const Color.fromARGB(255, 33, 243, 121),
            minimumSize: Size(140, 48)
          ),
          onPressed: (){
            CrearCancionDatasourceImple().AddMusic(letra,"me",titulo,userId);
              BusquedaDatasourceImpl().AddBusqueda(letra,userId);

            ref.read(crearCancionesProvider.notifier).actualizarData();
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              backgroundColor: Color.fromARGB(255, 70, 244, 54),
              content: Text("Guardado correctamente"),
            ),           
          );
            //   AnecdoteFunnyDatasourceImpl().AddAnecdote(subtitleController.text,titleController.text.toUpperCase(),indexImage);
            // ref.read(anecdotasGraciosasProvider.notifier).actualizarData();
            // context.pop();
          }, child: Text("Guardar",style: TextStyle(color: Colors.black),)),
      
      ],
    );
  }
}
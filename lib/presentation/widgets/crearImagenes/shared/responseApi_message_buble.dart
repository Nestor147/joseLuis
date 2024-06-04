import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/busquedas/busquedas_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:cuteapp/presentation/widgets/shared/buttonsAddDelete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponseApiMessageBuble extends ConsumerStatefulWidget {
   CustomCrearImagenEntities image;
   ResponseApiMessageBuble({super.key,required this.image});

  @override
  ResponseApiMessageBubleState createState() => ResponseApiMessageBubleState();
}
class ResponseApiMessageBubleState extends ConsumerState<ResponseApiMessageBuble> {
  
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
        _ImageResponseApi(imageURL: widget.image.pathImageUrl),
        SizedBox(height: 10,),
        buttonsAddDeleteImage(context: context,imageUrl: widget.image.pathImageUrl,userId:user.userId ,descripcion: widget.image.descripcion,),
        SizedBox(height: 10,),
      ],
    );
    
  }
}

class _ImageResponseApi extends StatelessWidget {
  final String imageURL;


  const _ImageResponseApi({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;
    return ClipRRect(borderRadius: BorderRadius.circular(20),
      child: Image.network(imageURL,
      width: size.width*0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress==null) return child;
        return Container(
          child: Text('Generando Imagen...'),
        );
      },)
      );
  }
}



class buttonsAddDeleteImage extends ConsumerWidget {
  final BuildContext context;
  final String imageUrl;
  final String userId;
  final String descripcion;
  const buttonsAddDeleteImage({
    super.key,

    required this.context,
    required this.imageUrl,
    required this.userId,
    required this.descripcion,
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
               final response= ref.read(usuarioPersistenteProvider.notifier).loadUserData();
              print(response);
              final userId=ref.watch(usuarioPersistenteProvider).userId;
              print("Este es el id del ${userId}");
              print("Este es el id del ${ref.watch(usuarioPersistenteProvider).userId}");
            CrearImageDatasourceImple().AddImage(descripcion, "me", imageUrl,userId);
              BusquedaDatasourceImpl().AddBusqueda(descripcion,userId);

            ref.read(crearImagenesProvider.notifier).actualizarData();
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
import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/busquedas/busquedas_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/infraestructure/datasources/crearRecetas/crearRecetas_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/crearRecetas/crearRecetas_provider.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/stadoDeCreacion_provider.dart';
import 'package:cuteapp/presentation/widgets/shared/buttonsAddDelete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecetaResponseApiMessageBuble extends ConsumerStatefulWidget {
   CustomRecetaEntities receta;
   RecetaResponseApiMessageBuble({super.key,required this.receta});

  @override
  RecetaResponseApiMessageBubleState createState() => RecetaResponseApiMessageBubleState();
}
class RecetaResponseApiMessageBubleState extends ConsumerState<RecetaResponseApiMessageBuble> {
  
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
        CustomRecetasScreen(receta: widget.receta.descripcion,),
        SizedBox(height: 10,),
        buttonsAddDeleteReceta(context: context,ingredientes: widget.receta.ingredientes,userId:user.userId ,descripcion: widget.receta.descripcion),
        SizedBox(height: 10,),
      ],
    );
    
  }
}

class CustomRecetasScreen extends ConsumerStatefulWidget {
   final String receta;
   CustomRecetasScreen({required this.receta, super.key});

  @override
  CustomRecetasScreenState createState() => CustomRecetasScreenState();
}

class CustomRecetasScreenState extends ConsumerState<CustomRecetasScreen> {
  
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
                    Text(widget.receta,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
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




// class _RecetaResponseApi extends StatelessWidget {
//   final String imageURL;


//   const _RecetaResponseApi({super.key, required this.imageURL});

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



class buttonsAddDeleteReceta extends ConsumerWidget {
  final BuildContext context;
  final String ingredientes;
  final String userId;
  final String descripcion;
  const buttonsAddDeleteReceta({
    super.key,

    required this.context,
    required this.ingredientes,
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
            CrearRecetasDatasourceImple().AddReceta(descripcion, "me", ingredientes,userId);
              BusquedaDatasourceImpl().AddBusqueda(descripcion,userId);

            ref.read(crearRecetasProvider.notifier).actualizarData();
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
import 'package:cuteapp/domain/entities/crearmusica/customMusic_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearCanciones/crearCancion_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/crearCanciones/crearCanciones_provider.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomMusicScreen extends ConsumerStatefulWidget {
   CustomMusicEntities music;
   CustomMusicScreen(this.music, {super.key});

  @override
  CustomMusicScreenState createState() => CustomMusicScreenState();
}
  bool isDone=false;

class CustomMusicScreenState extends ConsumerState<CustomMusicScreen> {
  
  @override
  Widget build(BuildContext context) {
  bool isDone=widget.music.isDon;
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
                        const SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children:  [
                              Container(
                                // width: 200,
                                width: 274,
                                child: Padding(
                                  
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(widget.music.titulo,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                ),
                              ),
                             Checkbox(value: isDone, onChanged:(value) {
                               setState(() {
                                 isDone=!isDone;
                               });
                               CrearCancionDatasourceImple().isdone(widget.music.id,isDone);
                                ref.read(idWidgetProvider.notifier).setIdWidget(widget.music.id);
                               ref.read(crearCancionesProvider.notifier).actualizarData();
                             },)
                           ],
                         ),
                        const SizedBox(height: 10,),
                    Text(widget.music.letra,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
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
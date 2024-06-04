import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearRecetas/crearRecetas_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:cuteapp/presentation/provider/crearRecetas/crearRecetas_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CustomRecetaScreen extends ConsumerStatefulWidget {
   CustomRecetaEntities receta;
   CustomRecetaScreen(this.receta, {super.key});

  @override
  CustomRecetaScreenState createState() => CustomRecetaScreenState();
}
  bool isDone=false;

class CustomRecetaScreenState extends ConsumerState<CustomRecetaScreen> {
  
  @override
  Widget build(BuildContext context) {
  bool isDone=widget.receta.isDon;
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
                                width: 272,
                                child: Padding(
                                  
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(widget.receta.ingredientes,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                ),
                              ),
                             Checkbox(value: isDone, onChanged:(value) {
                               setState(() {
                                 isDone=!isDone;
                               });
                               CrearRecetasDatasourceImple().isdone(widget.receta.id, isDone);
                                ref.read(idWidgetProvider.notifier).setIdWidget(widget.receta.id);
                               ref.read(crearRecetasProvider.notifier).actualizarData();
                             },)
                           ],
                         ),
                        const SizedBox(height: 1,),
                    Text(widget.receta.descripcion,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
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
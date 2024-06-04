import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:cuteapp/infraestructure/datasources/crearImagenes/crearImagenes_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:cuteapp/presentation/provider/crearImagenes/crearImagenes_provider.dart';
import 'package:cuteapp/presentation/provider/numero_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CustomImageScreen extends ConsumerStatefulWidget {
   CustomCrearImagenEntities image;
   CustomImageScreen(this.image, { super.key});

  @override
  CustomImageScreenState createState() => CustomImageScreenState();
}
  bool isDone=false;

class CustomImageScreenState extends ConsumerState<CustomImageScreen> {
  
  @override
  Widget build(BuildContext context) {
  bool isDone=widget.image.isDon;

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
              child: Column(
                children: [
                   Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Container(
                                // width: 200,
                                width: 280,
                                child: Padding(
                                  
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(widget.image.descripcion,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                ),
                              ),
                             Checkbox(value: isDone, onChanged:(value) {
                               setState(() {
                                 isDone=!isDone;
                               });
                               CrearImageDatasourceImple().isdone(widget.image.id, isDone);
                                ref.read(idWidgetProvider.notifier).setIdWidget(widget.image.id);
                               ref.read(crearImagenesProvider.notifier).actualizarData();
                             },)
                           ],
                         ),
                        const SizedBox(height: 10,),
                    // Text(widget.image.descripcion,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
                    const Spacer(),
                    // butones(context)
                      ],
                    ),
                  ),
                  // image(),
                  const SizedBox(width: 50,),
                  Container(
        width: 350,
        height:220,
 
        // child: Image.network( "https://www.lavanguardia.com/andro4all/hero/2023/04/6d8841b6-9d24-457a-95c5-0d3de1d7bf5f.png?width=768&aspect_ratio=16:9&format=nowebp",
        child: Image.network( "${widget.image.pathImageUrl}",
        fit:BoxFit.fill,
        loadingBuilder:(context, child, loadingProgress) {
          if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator(strokeWidth: 5,),);   
        }
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 20, 23, 43),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
                        const SizedBox(height: 10,), 
                ],
              ),
            ),
          ),
        ),
    );
    
  }
}
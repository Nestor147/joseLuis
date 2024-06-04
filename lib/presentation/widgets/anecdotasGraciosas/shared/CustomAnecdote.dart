import 'package:cuteapp/domain/entities/AnecdotasGraciosas/anecdotasGraciosas_entities.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/provider/idWidget_provider.dart';
import 'package:cuteapp/presentation/provider/numero_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/infraestructure/datasources/anecdotasGraciosas/anecdoteFunnyDatasource_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Anecdota extends ConsumerStatefulWidget {
   CustomAnecdotaEntities anecdote;
   Anecdota(this.anecdote, {super.key});

  @override
  AnecdotaState createState() => AnecdotaState();
}
  bool isDone=false;

class AnecdotaState extends ConsumerState<Anecdota> {
  
  @override
  Widget build(BuildContext context) {
  bool isDone=widget.anecdote.isDon;
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
                  image(),
                  const SizedBox(width: 20,),
    
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Text(widget.anecdote.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                             Checkbox(value: isDone, onChanged:(value) {
                               setState(() {
                                 isDone=!isDone;
                               });
                               AnecdoteFunnyDatasourceImpl().isdone(widget.anecdote.id, isDone);
                               ref.read(idWidgetProvider.notifier).setIdWidget(widget.anecdote.id);
                               ref.read(anecdotasGraciosasProvider.notifier).actualizarData();
                             },)
                           ],
                         ),
                        const SizedBox(height: 1,),
                    Text(widget.anecdote.descripcion,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.shade400)),
                    const Spacer(),
                    butones(context)
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

  Widget butones(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(color: colorTheme,
                        borderRadius: BorderRadius.circular(18)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                          child: Row(children: [
                            const Icon(Icons.alarm),
                            const SizedBox(width: 10,),
                            Text(widget.anecdote.time,style: const TextStyle(color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                          ]),
                        ) ,
                      
                      ),
                      const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                               ref.read(idWidgetProvider.notifier).setIdWidget(widget.anecdote.id);
                            context.push('/editAnecdota');

                          },
                          child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(color: colorTheme,
                          borderRadius: BorderRadius.circular(18)
                          ),
                          child:const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                            child: Row(children: [
                              Icon(Icons.edit_document),
                              SizedBox(width: 10,),
                              Text("Edit",style: TextStyle(color: Color.fromARGB(255, 254, 255, 254),fontWeight: FontWeight.bold),),
                            ]),
                          ) ,
                                                
                                                ),
                        ),
                    ],
                  ),
                );
  }

  Widget image() {
    final int number=widget.anecdote.image;
    return Container(
      height: 120,
      width: 100,
      decoration:  BoxDecoration(
                color:colorTheme,
                image: DecorationImage(
                  image: AssetImage('assets/${number}.jpg'),
                  fit: BoxFit.cover)
              ),);
  }
}
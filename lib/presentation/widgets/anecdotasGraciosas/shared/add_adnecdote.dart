import 'package:cuteapp/infraestructure/datasources/busquedas/busquedas_datasource_impl.dart';
import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/anecdotasGraciosas/anecdotasGraciosas_provider.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextFieldTitle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cuteapp/infraestructure/datasources/anecdotasGraciosas/anecdoteFunnyDatasource_impl.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextField.dart';
import 'package:cuteapp/presentation/widgets/shared/customtextFieldDoble.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAnecdote extends StatefulWidget {
  const AddAnecdote({super.key});

  @override
  State<AddAnecdote> createState() => _AddAnecdoteState();
}

class _AddAnecdoteState extends State<AddAnecdote> {
  final titleController=TextEditingController();
  final subtitleController=TextEditingController();
  FocusNode _titleFocusNode=FocusNode();
  FocusNode _subtitleFocusNode=FocusNode();
  int indexImage=0;
  final int imagesPerPage = 15;

  @override
  Widget build(BuildContext context) {
    final colorTheme=Theme.of(context).colorScheme;
    return Scaffold(
      // appBar: AppBar(title: Text("Momento gracioso"),
      appBar: AppBar(title: Text("Anécdota "),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
        CustomTextFieldTitle(colorTheme: colorTheme, focusNode: _titleFocusNode, controller: titleController, typeName: "Titulo", icon: Icons.note),
        SizedBox(height: 10,),
        CustomTextFieldDouble(colorTheme: colorTheme, focusNode: _subtitleFocusNode, controller: subtitleController, typeName: "Describe que paso", numberOfLines: 3),
        SizedBox(height: 10,),
        
        Container(
        height: 130,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index) {
            index=index+1;
            return GestureDetector(
              onTap: (){
                setState(() {
                indexImage=index;
                print(index);

                });
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 188, 235),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 5,         
                        color:indexImage==index ? Colors.green :Colors.grey)
                      ),
                      width: 90,
                      margin: EdgeInsets.all(8),
                      child: Column(children: [
                        Image.asset('assets/${index}.jpg',fit: BoxFit.fitHeight,),  
                      ]),
                    ),
                  ],
                ),
              ),
            );
        },),
          ),
           Container(
        height: 124,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index) {
            index=index+16;
            return GestureDetector(
              onTap: (){
                setState(() {  
                indexImage=index;
                print(index);
                });
              },
              child: Container(
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 188, 235),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 5,         
                  color:indexImage==index ? Colors.green :Colors.grey)
                ),
                width: 90,
                margin: EdgeInsets.all(8),
                child: Column(children: [
                  Image.asset('assets/${index}.jpg',fit: BoxFit.fitHeight,),  
                ]),
              ),
            );
        },),
          ),
           Container(
        height: 130,
        child: ListView.builder(
          itemCount: 13,
          scrollDirection: Axis.horizontal,

          itemBuilder:(context, index) {
            index=index+31;
            return GestureDetector(
              onTap: (){
                setState(() {
                indexImage=index;
                print(index);
                });
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 188, 235),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 5,         
                        color:indexImage==index ? Colors.green :Colors.grey)
                      ),
                      width: 90,
                      margin: EdgeInsets.all(8),
                      child: Column(children: [
                        Image.asset('assets/${index}.jpg',fit: BoxFit.fitHeight,),  
                      ]),
                    ),
                  ],
                ),
              ),
            );
        },),
          ),
         
        SizedBox(height: 15,),
        buttonAnecdote(subtitleController: subtitleController, titleController: titleController, indexImage: indexImage, context: context, )
          ],),
      ),
    );
  }
}



class buttonAnecdote extends ConsumerWidget {
  const buttonAnecdote({
    super.key,
    required this.subtitleController,
    required this.titleController,
    required this.indexImage,
    required this.context,
  });

  final TextEditingController subtitleController;
  final TextEditingController titleController;
  final int indexImage;
  final BuildContext context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            // primary: Colors.blue,
            minimumSize: Size(170, 48)
          ),
          onPressed: (){
            if(titleController.text.isEmpty || subtitleController.text.isEmpty)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            
                            content: Text('Por favor, completa todos los campos.'),
                          ),
                        );

            }else{
              
              final response= ref.read(usuarioPersistenteProvider.notifier).loadUserData();
              print(response);
              final userId=ref.watch(usuarioPersistenteProvider).userId;
              print("Este es el id del ${userId}");
              print("Este es el id del ${ref.watch(usuarioPersistenteProvider).userId}");

              AnecdoteFunnyDatasourceImpl().AddAnecdote(subtitleController.text,titleController.text.toUpperCase(),indexImage,userId);
              BusquedaDatasourceImpl().AddBusqueda(subtitleController.text,userId);
            ref.read(anecdotasGraciosasProvider.notifier).actualizarData();
            context.pop();
            }
          }, child: Text("Crear Anécdota")),
           ElevatedButton(
          style: ElevatedButton.styleFrom(
            // primary: Colors.red,
            minimumSize: Size(170, 48)
          ),
          onPressed: (){
            context.pop();
          }, child: Text("Cancelar"))
      ],
    );
  }
}
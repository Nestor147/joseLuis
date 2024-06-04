import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class buttonsAddDelete extends ConsumerWidget {
  const buttonsAddDelete({
    super.key,

    required this.context,
  });


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
            
            //   AnecdoteFunnyDatasourceImpl().AddAnecdote(subtitleController.text,titleController.text.toUpperCase(),indexImage);
            // ref.read(anecdotasGraciosasProvider.notifier).actualizarData();
            // context.pop();
            
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
import 'package:cuteapp/domain/entities/CrearRecetas/customRecetas_entities.dart';
import 'package:cuteapp/domain/entities/crearImagenes/crearImagen_entities.dart';
import 'package:flutter/material.dart';

class RecetaMyMessageBuble extends StatelessWidget {
  final CustomRecetaEntities receta;

  const RecetaMyMessageBuble({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.primary
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(receta.ingredientes ,style: TextStyle(color: Colors.white),),
          ),
        ),

        SizedBox(height: 10,)
      ],
    );
  }
}
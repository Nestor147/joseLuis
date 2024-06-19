import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/components/basicCardForResource.dart';
import 'package:flutter/material.dart';

class IntermediariosScreen extends StatefulWidget {
  const IntermediariosScreen({super.key});

  @override
  State<IntermediariosScreen> createState() => _IntermediariosScreenState();
}

class _IntermediariosScreenState extends State<IntermediariosScreen> {
 List listResourcesForCuna = [
   // ["Resumen Escuela Sabática", "assets/leccion.png", '/leccion'],
    ["Lección Alumnos","Todo lo que se llevara en el trimestre", "assets/leccion.png", '/leccionIntermediario',Icon(Icons.accessibility_outlined,color: Colors.white,)],
    ["Lección Maestros","Esta es la versión ampliada para maestros", "assets/leccionMaestros.png", '/leccionMaestrosIntermediario',Icon(Icons.document_scanner_rounded,color: Colors.white)],
    ["Materiales","Materiales adicionales para apoyar la lección", "assets/material.png",'/materialIntermediario',Icon(Icons.add_to_drive,color: Colors.white)],
    ["Multimedia","Videos Escuela Sabática", "assets/multimedia.png", '/multimediaIntermediario',Icon(Icons.video_call_outlined,color: Colors.white)],
    ["Misionero Niños", "Informe Misionero","assets/misionero.png",'/misionero',Icon(Icons.map,color: Colors.white)],
    // ["Extras", "Indicaciones para una mejor clase","assets/extras.png",'/extras',Icon(Icons.add_box,color: Colors.white)],


  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorFondo,
     appBar: AppBar(
        title: const Text("Recursos para Intermedios",style: TextStyle(color: Colors.black),),
        centerTitle: true,backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 5, 15, 5),
        child: Column(
         children: List.generate(listResourcesForCuna.length, (index) => CardForResource(
              title: listResourcesForCuna[index][0],
              subtitle: listResourcesForCuna[index][1],
              imageURL: listResourcesForCuna[index][2],
              screenPath: listResourcesForCuna[index][3],
              iconData: listResourcesForCuna[index][4],
               
            ))
          
        ),
      ),
    );
  }
}
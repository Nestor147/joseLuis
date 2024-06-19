import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/components/basicCardForResource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CunaScreen extends ConsumerStatefulWidget {
  const CunaScreen({super.key});

  @override
  ChurchScreenState createState() => ChurchScreenState();
}

class ChurchScreenState extends ConsumerState<CunaScreen> {
  List listResourcesForCuna = [
   // ["Resumen Escuela Sabática", "assets/leccion.png", '/leccion'],
    ["Lección Alumnos","Todo lo que se llevara en el trimestre", "assets/leccion.png", '/leccionCuna',Icon(Icons.accessibility_outlined,color: Colors.white,)],
    ["Lección Maestros","Esta es la versión ampliada para maestros", "assets/leccionMaestros.png", '/leccionMaestrosCuna',Icon(Icons.document_scanner_rounded,color: Colors.white)],
    ["Materiales","Materiales adicionales para apoyar la lección", "assets/material.png",'/materialCuna',Icon(Icons.add_to_drive,color: Colors.white)],
    ["Multimedia","Videos Escuela Sabática", "assets/multimedia.png", '/multimediaCuna',Icon(Icons.video_call_outlined,color: Colors.white)],
    ["Misionero Niños", "Informe Misionero","assets/misionero.png",'/misioneroCuna',Icon(Icons.map,color: Colors.white)],
    // ["Extras", "Indicaciones para una mejor clase","assets/extras.png",'/extras',Icon(Icons.add_box,color: Colors.white)],


  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorFondo,
      appBar: AppBar(
        title: const Text("Recursos para Cuna",style: TextStyle(color: Colors.black),),
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

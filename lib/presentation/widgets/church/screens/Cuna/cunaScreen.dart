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
    ["Lección Alumnos","Todo lo que se llevara en el trimestre", "assets/leccion.png", '/leccion',Icon(Icons.accessibility_outlined,color: Colors.white,)],
    ["Lección Maestros","Esta es la versión ampliada para maestros", "assets/leccionMaestros.png", '/leccionMaestros',Icon(Icons.document_scanner_rounded,color: Colors.white)],
    ["Materiales","Materiales adicionales para apoyar la lección", "assets/material.png",'/material',Icon(Icons.add_to_drive,color: Colors.white)],
    ["Multimedia","Audios y Videos Escuela Sabática", "assets/multimedia.png", '/multimedia',Icon(Icons.video_call_outlined,color: Colors.white)],
    ["Misionero Niños", "Informe Misionero","assets/misionero.png",'/misionero',Icon(Icons.map,color: Colors.white)],
    ["Extras", "Indicaciones para una mejor clase","assets/extras.png",'/extras',Icon(Icons.add_box,color: Colors.white)],


  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuna",style: TextStyle(color: Colors.white),),
        centerTitle: true,backgroundColor: Color.fromARGB(255, 11, 35, 86),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 5, 15, 5),
        child: Column(
          children: [
            Expanded(child: GridView.builder(
              itemCount: listResourcesForCuna.length,
             padding: EdgeInsets.all(12),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                //  crossAxisSpacing: 50,
                //  mainAxisSpacing: 5,
              childAspectRatio: 1 / 2
              ) ,
              itemBuilder:(context, index) {
                return CardForResource(
              title: listResourcesForCuna[index][0],
              subtitle: listResourcesForCuna[index][1],
              imageURL: listResourcesForCuna[index][2],
              screenPath: listResourcesForCuna[index][3],
              iconData: listResourcesForCuna[index][4],
               // Uso de index para acceder a cada elemento
            );
              },
               ))
            
          ] 
          
        ),
      ),
    );
  }
}

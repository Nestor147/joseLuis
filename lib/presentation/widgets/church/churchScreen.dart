import 'package:cuteapp/presentation/widgets/church/screens/shared/components/BasicCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChurchScreen extends ConsumerStatefulWidget {
  const ChurchScreen({super.key});

  @override
  ChurchScreenState createState() => ChurchScreenState();
}

class ChurchScreenState extends ConsumerState<ChurchScreen> {
  List listResourcesFor = [
    ["CUNA","0 a 3 años ", "assets/cuna.png", '/cuna'],
    ["INFANTE","3 a 5 años ", "assets/infantes.png", '/infante'],
    ["PRIMARIOS","6 a 9 años ", "assets/primarios.png", '/primarios'],
    ["INTERMEDIARIO","10 a 12 años", "assets/intermediarios.png",'/intermediarios'],
    ["JUVENILES","15 a 18 años ", "assets/juveniles.png", '/juveniles'],
    ["ADULTOS","19 a 100 años  ", "assets/adultos.png", '/adultos'],
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recursos Adventistas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 15, 5),
          child: Column(
            children: List.generate(listResourcesFor.length, (index) {
              return BasicCard(
                age: listResourcesFor[index][1],
                screenPath: listResourcesFor[index][3], // Uso de index para acceder a cada elemento
                imageURL: listResourcesFor[index][2],
                title: listResourcesFor[index][0],
              );
            }),
          ),
        ),
      ),
    );
  }
}

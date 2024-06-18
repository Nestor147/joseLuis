import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/presentation/widgets/church/screens/shared/components/BasicCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChurchScreen extends ConsumerStatefulWidget {
  const ChurchScreen({super.key});

  @override
  ChurchScreenState createState() => ChurchScreenState();
}

class ChurchScreenState extends ConsumerState<ChurchScreen> {
  List listResourcesFor = [
    ["CUNA","recursos", "assets/cuna.png", '/cuna'],
    ["INFANTE","recursos", "assets/infantes.png", '/infante'],
    ["PRIMARIOS","recursos", "assets/primarios.png", '/primarios'],
    ["INTERMEDIARIO","recursos", "assets/intermediarios.png",'/intermediarios'],
    ["JUVENILES","recursos", "assets/juveniles.png", '/juveniles'],
    ["ADULTOS","recursos", "assets/adultos.png", '/adultos'],
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuersos",style: TextStyle(color: Colors.white),),
        centerTitle: true,backgroundColor:colorSDATheme,leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){context.push("/");},)
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

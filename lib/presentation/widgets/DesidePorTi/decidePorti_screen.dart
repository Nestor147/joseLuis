import 'package:flutter/material.dart';
import 'dart:math';
class DecidePorTiScreen extends StatefulWidget {
  const DecidePorTiScreen({super.key});

  @override
  State<DecidePorTiScreen> createState() => _DecidePorTiScreenState();
}

class _DecidePorTiScreenState extends State<DecidePorTiScreen> {
    double width=100;
  double height=100;
  double radius=10;
  int numero=5;
    String texto="SI";

  Color color=Color.fromARGB(31, 180, 50, 50);
  void ramdomAnimated(){
    setState(() {
      width=Random().nextInt(300)+120;
      height=Random().nextInt(300)+120;
      radius=Random().nextInt(70)+20;
      color=Color.fromARGB( Random().nextInt(255), Random().nextInt(255), Random().nextInt(255),1);
      numero=(width+height).toInt();
      print(numero);
      texto=(numero%2==0)?texto="Si":texto="No";
      print(texto);
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text('Decide por tí'),centerTitle: true,
      ),body: Center(
        child: AnimatedContainer(
          child: Center(child: Text(texto,style: TextStyle(fontSize: 40),),),
          duration: Duration(milliseconds: 300),
          curve:Curves.easeInOut,
          width: width <=0 ? 0:width,
          height: height <= 0 ?0:height,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(radius<=0?0:radius),
            color: color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ramdomAnimated();
      },child: Icon(Icons.play_arrow),),

    
    );
  }
}
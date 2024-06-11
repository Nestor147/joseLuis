import 'package:flutter/material.dart';

class RecursosInfantiles extends StatefulWidget {
  const RecursosInfantiles({super.key});

  @override
  State<RecursosInfantiles> createState() => _RecursosInfantilesState();
}

class _RecursosInfantilesState extends State<RecursosInfantiles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("recursos de infantiles"),),
    );
  }
}
import 'package:flutter/material.dart';

class RecursosAdultos extends StatefulWidget {
  const RecursosAdultos({super.key});

  @override
  State<RecursosAdultos> createState() => _RecursosAdultosState();
}

class _RecursosAdultosState extends State<RecursosAdultos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("recursos de adultos"),),
    );
  }
}
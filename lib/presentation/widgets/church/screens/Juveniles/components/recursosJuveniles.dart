import 'package:flutter/material.dart';

class RecursosJuveniles extends StatefulWidget {
  const RecursosJuveniles({super.key});

  @override
  State<RecursosJuveniles> createState() => _RecursosJuvenilesState();
}

class _RecursosJuvenilesState extends State<RecursosJuveniles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("recursos de juveniles"),),
    );
  }
}
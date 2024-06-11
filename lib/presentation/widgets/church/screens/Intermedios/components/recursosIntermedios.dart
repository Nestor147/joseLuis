import 'package:flutter/material.dart';

class RecursosInternmedios extends StatefulWidget {
  const RecursosInternmedios({super.key});

  @override
  State<RecursosInternmedios> createState() => _RecursosInternmediosState();
}

class _RecursosInternmediosState extends State<RecursosInternmedios> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("recursos de intermediarios"),),
    );
  }
}
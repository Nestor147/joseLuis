import 'package:flutter/material.dart';

class RecursosPrimarios extends StatefulWidget {
  const RecursosPrimarios({super.key});

  @override
  State<RecursosPrimarios> createState() => _RecursosPrimariosState();
}

class _RecursosPrimariosState extends State<RecursosPrimarios> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("recursos de primarios"),),
    );
  }
}
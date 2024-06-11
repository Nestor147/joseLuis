import 'package:flutter/material.dart';


class SectionResource extends StatefulWidget {
  const SectionResource({super.key});

  @override
  State<SectionResource> createState() => _SectionResourceState();
}

class _SectionResourceState extends State<SectionResource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuna"),centerTitle: true,
        
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          
        ],
      ),),
    );
  }
}
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:cuteapp/infraestructure/datasources/momentosGraciosos/funnyMoment_datasource.dart';
import 'package:flutter/material.dart';
class UserFavorite extends StatelessWidget {
  const UserFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MUY PRONTO"),centerTitle: true,),
      body: Center(child: Image.asset('assets/5.jpg')),
    );
  }
}
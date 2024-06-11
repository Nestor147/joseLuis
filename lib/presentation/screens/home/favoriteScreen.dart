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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user =FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       
      appBar: AppBar(actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],),
      body: SingleChildScrollView(
        child:  Column(children: [
          Center(child: Text("Logeo de "+user.email!,style: TextStyle(fontSize: 20),)),      
      ],)
      )
    );
  }
}



import 'package:cuteapp/presentation/provider/UsuarioPersistente_provider.dart';
import 'package:cuteapp/presentation/provider/customUser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class UserSearch extends ConsumerWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userAuth=ref.watch(customUserProvider);
    final idUser=ref.watch(usuarioPersistenteProvider).userId;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 140, 232),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Text("Search",
          style: TextStyle(fontSize: 60,color:Colors.white ),), ), 
          Text("${idUser}"),
          Text(userAuth.name),
          Text(userAuth.email),
          Text(userAuth.role),
          ]
      ),
    );
  }
}
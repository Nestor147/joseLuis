import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name, userRole;

  const InfoCard({super.key, required this.name, required this.userRole});
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(CupertinoIcons.person,
        color: Colors.white,),
      ),
      title: Text(
        name,style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(userRole,style: const TextStyle(color: Colors.white)),
    );
  }
}
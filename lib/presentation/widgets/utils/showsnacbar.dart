import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 4, 41, 70),
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "MonB"
        ),
      ))
  );
}
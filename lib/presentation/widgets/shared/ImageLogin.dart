import 'package:flutter/material.dart';


class ImageLogin extends StatelessWidget {
  final String imagePath;
  final VoidCallback signGoogle;

  const ImageLogin({super.key, required this.imagePath, required this.signGoogle});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: signGoogle,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}